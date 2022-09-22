#!/usr/bin/env bash
for f in vendor/*.atpack; do
    unzip -juLL $f '**.svd'
done
