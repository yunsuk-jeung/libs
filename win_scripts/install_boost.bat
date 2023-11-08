DST_DIR=${HOME}/dev/emulator/src/boost

./bootstrap.sh --prefix=${DST_DIR} --includedir=headers --libdir=dist --with-libraries=date_time
./b2 --prefix=${DST_DIR} install