#!/usr/bin/env python
import psutil
proc = psutil.Process()
print(proc.open_files())