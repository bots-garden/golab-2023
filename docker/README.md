  # Build of capsule-http Docker image
  build-push-docker-image:
    vars:
      IMAGE_BASE_NAME: "capsule-http"
      IMAGE_TAG: "0.4.2"
    cmds:
      - echo "👋 {{.IMAGE_BASE_NAME}}-{{.GOOS}}-{{.GOARCH}}:{{.IMAGE_TAG}}"
      - |
        cd capsule-http
        docker login -u ${DOCKER_USER} -p ${DOCKER_PWD}
        docker buildx build --platform {{.GOOS}}/{{.GOARCH}} --push -t ${DOCKER_USER}/{{.IMAGE_BASE_NAME}}-{{.GOOS}}-{{.GOARCH}}:{{.IMAGE_TAG}} .

  build-docker-capsule-http-image-linux-amd64:
    vars:
      GOOS: "linux" 
      GOARCH: "amd64"
    cmds:
      - task: build-capsule-http-for-docker
        vars: { GOOS: '{{.GOOS}}', GOARCH: '{{.GOARCH}}' }
      - task: build-push-docker-image
        vars: { 
          GOOS: '{{.GOOS}}', 
          GOARCH: '{{.GOARCH}}'
        }
