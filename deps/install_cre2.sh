RST='\033[0m'
PURPLE='\033[00;35m'
GREEN='\033[00;32m'
RED='\033[00;31m'

rm -rf cre2
echo "${PURPLE}Installing cre2${RST}"
echo "${PURPLE}Fetching cre2${RST}"
git clone git://github.com/marcomaggi/cre2.git
echo "${PURPLE}Extracting cre2${RST}"

cd cre2
echo "${PURPLE}Autogen-ing Configuration${RST}"
sh autogen.sh
echo "${PURPLE}Configuring cre2${RST}"
./configure --enable-maintainer-mode && \
  echo "${PURPLE}Building cre2${RST}" && \
  make && \
  echo "${PURPLE}Installing cre2${RST}" && \
  make install && \
  echo "${GREEN}cre2 installed${RST}"

