#!/bin/bash
# CPU load command used to test Auto Scaling / CloudWatch.
stress-ng --cpu <NUMBER_OF_WORKERS> --timeout <DURATION>