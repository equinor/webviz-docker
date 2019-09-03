git clone https://github.com/equinor/webviz-config.git
webviz certificate
webviz build webviz-config/examples/basic_example.yaml --portable ./example_app
pushd example_app
docker build -t webviz/example_image
popd
