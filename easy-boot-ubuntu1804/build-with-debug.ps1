$env:PACKER_LOG=1
$env:PACKER_LOG_PATH="packer-debug-log.txt"
packer build -on-error=ask .\box-config.json 
