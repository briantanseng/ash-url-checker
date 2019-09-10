# ash-url-checker
URL checker using curl triggered by cron packaged in Docker. Script used: /bin/ash or Ash (Almquist Shell) provided by BusyBox.

## Run via Docker

### Build an image
```
docker build -t briantanseng/ash-url-checker .
```

### Run a container

Create an output directory:
```
mkdir -p ~/your-output-directory
```

Run using interactive mode:
```
docker run --name ash-url-checker \
-v ~/your-output-directory:/app/output \
-it briantanseng/ash-url-checker
```
Run as a background process:
```
docker run --name ash-url-checker \
-v ~/your-output-directory:/app/output \
-d briantanseng/ash-url-checker
```

A CSV file will be created and updated with the status of your URLs.

### Cleanup
```
docker stop ash-url-checker && docker rm ash-url-checker
```

Based on [this solution](https://stackoverflow.com/questions/37015624/how-to-run-a-cron-job-inside-a-docker-container) at StackOverflow.

