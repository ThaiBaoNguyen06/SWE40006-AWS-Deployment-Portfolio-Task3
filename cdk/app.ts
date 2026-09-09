#!/usr/bin/env node
import * as cdk from 'aws-cdk-lib';
import { WordPressStack } from './lib/wordpress-stack';

const app = new cdk.App();

new WordPressStack(app, 'SWE40006WordPressStack', {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: 'ap-southeast-2',
  },
});
