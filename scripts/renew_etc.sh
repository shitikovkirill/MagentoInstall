set -ex
EFS_ROOT="/mnt/efs"

echo "Renew etc"
yes | cp -rf "./app/etc/*" "${EFS_ROOT}/etc/"
