#!/bin/bash
VERSION=$1
OS=linux
ARCH=amd64

# Handle flags
OPTSTRING="v:o:a:"

while getopts ${OPTSTRING} opt; do
  case ${opt} in
    v)
      VERSION=${OPTARG}
      ;;
  
    o)
      OS=${OPTARG}
      ;;

    a)
      ARCH=${OPTARG}
      ;;
      
    :)
      echo "Option -${OPTARG} requires an argument."
      exit 1
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

# Read the go version
if [ $# -eq 0 ]; then  # Check if any arguments were passed
  echo "Please provide a go version"
  exit 1
fi

# Installing
echo "Installing go $VERSION.$OS-$ARCH"
echo "Are you sure you want to continue? (y/N)"
read -r -p "[Y/n] " response

if [[ "$response" =~ ^[Nn] ]]; then
  echo "Cancelled."
  exit 0  # Exit with success code (no action taken)
fi

cd $HOME
wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
tar -xvf go$VERSION.$OS-$ARCH.tar.gz

echo "Removing older versions"
sudo rm -rf /usr/local/go* && sudo rm -rf /usr/local/go

mv go go-$VERSION
sudo mv go-$VERSION /usr/local

# Exit with a success message
echo "Installation complete!"
exit 0
