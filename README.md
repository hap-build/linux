# Helpful Linux Scripts

## Adding

    git submodule add git@github.com:hap-build/ubuntu scripts/ubuntu

## Hap Config

    [build "hap"]
    cmd = "./scripts/linux/install-hap.sh"

    [build "system"]
    cmd = "./scripts/linux/ubuntu/utils.sh"
    cmd = "./scripts/linux/set-hostname.sh $HAP_HOSTNAME"
    cmd = "./scripts/linux/set-dns.sh"
    cmd = "./scripts/linux/ubuntu/set-utc.sh"
