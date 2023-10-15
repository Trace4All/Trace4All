echo "---------> Downloading dependencies..."
apt-get -y install curl unzip tar zip
apt-get -y install pkg-config
pip install intel-cmplr-lib-rt
cd anomaly_detection/src/tracegnn/models/gtrace/cache


git clone https://github.com/microsoft/vcpkg.git --depth=1
cd vcpkg
bash bootstrap-vcpkg.sh
cd ..

echo "---------> Building dependencies..."
rm -r build
mkdir build
cd build

cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4

echo "---------> Finished!"
