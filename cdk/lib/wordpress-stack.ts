import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as autoscaling from 'aws-cdk-lib/aws-autoscaling';
import * as elbv2 from 'aws-cdk-lib/aws-elasticloadbalancingv2';

export class WordPressStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // Supporting example: use the account's default VPC.
    const vpc = ec2.Vpc.fromLookup(this, 'Vpc', { isDefault: true });

    // Replace with the AMI created from the configured WordPress EC2 instance.
    const machineImage = ec2.MachineImage.genericLinux({
      'ap-southeast-2': 'ami-REPLACE_WITH_WORDPRESS_AMI_ID',
    });

    const asg = new autoscaling.AutoScalingGroup(this, 'WordPressASG', {
      vpc,
      minCapacity: 2,
      desiredCapacity: 2,
      maxCapacity: 4,
      instanceType: new ec2.InstanceType('t3.micro'),
      machineImage,
    });

    asg.addUserData(
      'systemctl enable httpd',
      'systemctl start httpd'
    );

    const alb = new elbv2.ApplicationLoadBalancer(this, 'WordPressALB', {
      vpc,
      internetFacing: true,
    });

    const listener = alb.addListener('HttpListener', {
      port: 80,
      open: true,
    });

    listener.addTargets('WordPressTargets', {
      port: 80,
      targets: [asg],
      healthCheck: { path: '/' },
    });

    new cdk.CfnOutput(this, 'AlbDnsName', {
      value: alb.loadBalancerDnsName,
    });
  }
}
