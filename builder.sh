#!/usr/bin/env sh
set -eu

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github-repository> <dockerhub-repository>"
  echo "Example: $0 mluukkai/express_app linyu-ririme/testing"
  exit 1
fi

github_repository="$1"
dockerhub_repository="$2"

case "$github_repository" in
  http://*|https://*)
    clone_url="$github_repository"
    ;;
  *)
    clone_url="https://github.com/$github_repository.git"
    ;;
esac

workdir="$(mktemp -d)"

cleanup() {
  rm -rf "$workdir"
}

trap cleanup EXIT

echo "Cloning $clone_url"
git clone "$clone_url" "$workdir/app"

if [ ! -f "$workdir/app/Dockerfile" ]; then
  echo "Error: repository root does not contain a Dockerfile"
  exit 1
fi

echo "Building image $dockerhub_repository"
docker build -t "$dockerhub_repository" "$workdir/app"

echo "Pushing image $dockerhub_repository"
docker push "$dockerhub_repository"

echo "Done: $dockerhub_repository"
