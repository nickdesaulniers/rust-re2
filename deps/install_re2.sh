RST='\033[0m'
PURPLE='\033[00;35m'
GREEN='\033[00;32m'
RED='\033[00;31m'

echo "${PURPLE}Installing re2${RST}"
rm -rf re2
echo "${PURPLE}Fetching re2${RST}"
curl -O re2.googlecode.com/files/re2-20130115.tgz
echo "${PURPLE}Extracting re2${RST}"

shasum -c re2-20130115.tgz.sha1
if [[ $? != 0 ]] ; then
  echo "${RED}SHA1 checksum did not match${RST}"
fi

tar zxf re2-20130115.tgz
rm re2-20130115.tgz
cd re2
echo "${PURPLE}Building and Installing re2${RST}"
make install && \
  echo "${GREEN}re2 installed${RST}"

