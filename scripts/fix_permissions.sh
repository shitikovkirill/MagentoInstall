set -ex

echo "Fix permission"
find . -type f -exec chmod 664 {} \;
find . -type d -exec chmod 775 {} \;
find "./var" "./pub/static" "./pub/media" ".app/etc" -type f -exec chmod g+w {} \;
find "./var" "./pub/static" "./pub/media" ".app/etc" -type d -exec chmod g+ws {} \;
find "./var" -type d -exec chmod 777 {} \;
chmod u+x "./bin/magento"
chown -R magento:magento "."
chmod -R g+w "./var/"
chmod -R g+w "./pub/media/"
echo "Done"
