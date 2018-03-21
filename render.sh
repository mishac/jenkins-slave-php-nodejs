#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
"

sed -r "$sedStr" $1
}

versions=(5.6 7.0 7.1 7.2)
for version in ${versions[*]}; do
  mkdir -p php-$version
  render Dockerfile.template > php-$version/Dockerfile
done
