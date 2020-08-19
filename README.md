# GitHub Action for jFrog CLI for Artifactory

Runs all jFrog CLI commands for artifactory. This will prefix any arguments passed with `jfrog rt`.

## Usage

### Inputs

- `url` - *Required* URL to your Artifactor instance
- `apikey`- *Required* Artifactory API Key
- `working_directory` - *Optional* Speccify a directory to run the CLI from
- `cmd0` - *Required* - jFrog CLI command.  Leave off the `jfrog rt` part
- `cmd<1-9>` - *Optional* - Additional jFrog CLI commands

### Example

```yaml
on: push
name: Main Workflow
jobs:
  artifactoryUpload:
    name: Upload Trigger
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1.2.0
    - name: build
      run: ./buildmyartifact.sh
    - name: publish to artifactory
      uses: TBCTSystems/artifactory-action@master
      with:
        url: 'https://company.jfrog.io/'
        credentials type: 'apikey'
        apikey: ${{ secrets.RT_APIKEY }}
        cmd0: u "dist/*" "/mu/repo/path/" --recursive=true --build-name=myawesomeapp
        cmd1: u "logs/*" "/mu/repo/path/" --recursive=true --build-name=myawesomeapp
```

## Recommended Secrets

You will need the following secrets for the API Key

