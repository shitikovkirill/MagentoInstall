set -ex
EFS_ROOT="/mnt/efs"

echo "Create ${EFS_ROOT}/etc/ folder"
mkdir -p "${EFS_ROOT}/etc/"

if [[ ! -L ./app/etc && -d ${MAGE_ROOT}/app/etc ]]; then
    echo "Delete ./app/etc folder"
    rm -rf "./app/etc"
    echo "Creating etc link"
    ln -s "${EFS_ROOT}/etc/" "./app/"
fi

echo "Create ${EFS_ROOT}/media/ folder"
mkdir -p "${EFS_ROOT}/media/"

if [[ ! -L ./pub/media/ && -d ./pub/media/ ]]; then
    echo "Delete ./pub/media/ folder"
    rm -rf "./pub/media/"
    echo "Creating media link"
    ln -s "${EFS_ROOT}/media/" "./pub/"
fi

echo "Done"
