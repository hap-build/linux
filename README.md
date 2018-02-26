# Helpful Linux Scripts

## Adding

    git submodule add git@github.com:hap-build/Linux scripts/linux

## Hap Config

    [build "hap"]
    cmd = "sudo ./scripts/linux/install-hap.sh"

    [build "system"]
    cmd = "sudo ./scripts/linux/ubuntu/utils.sh"
    cmd = "sudo ./scripts/linux/set-hostname.sh $HAP_HOSTNAME"
    cmd = "sudo ./scripts/linux/set-dns.sh"
    cmd = "sudo ./scripts/linux/ubuntu/set-utc.sh"
