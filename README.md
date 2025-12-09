# Butler Docker Container

A Docker container for [itch.io's butler](https://itch.io/docs/butler/), the command-line tool for uploading and managing game builds on itch.io.  This containerized version enables integration into CI/CD pipelines and provides a portable alternative to local installation.

## Usage

### Basic Command

Run `butler --version` command directly through Docker:

```bash
docker run --rm ghcr.io/delta3-studio/butler:latest --version
```

### Push a Build to itch.io

```bash
docker run --rm \
  -v $(pwd)/build:/build \
  -e BUTLER_API_KEY=your_api_key \
  ghcr.io/delta3-studio/butler:latest \
  push /build user/game: channel
```

### Using in CI/CD

#### GitHub Actions Example

```yaml
- name: Push to itch.io
  run: |
    docker run --rm \
      -v ${{ github.workspace }}/build:/build \
      -e BUTLER_API_KEY=${{ secrets.BUTLER_API_KEY }} \
      ghcr.io/delta3-studio/butler:latest \
      butler push /build user/game:channel
```

## Environment Variables

- `BUTLER_API_KEY`: Your itch.io API key for authentication. 

## Building Locally

```bash
git clone https://github.com/Delta3-Studio/butler.git
cd butler
docker build -t local:butler .
```

## Documentation

For complete butler documentation, visit the [official itch.io butler docs](https://itch.io/docs/butler/).

## License

Distributed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome.  Please open issues or submit pull requests for improvements or bug fixes. 
