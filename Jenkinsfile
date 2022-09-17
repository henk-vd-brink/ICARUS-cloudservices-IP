def VERSION = "${BRANCH_NAME}"
def BUILD_VERSION = VERSION
def isRelease = false

pipeline {
  agent { any
  }
  stages {
    stage('Prepare') {
      steps {
        script {
          developer_email=sh(returnStdout: true, script: "git --no-pager show -s --format='%ae' ${GIT_COMMIT}").trim()
          switch (BRANCH_NAME) {
            case ~'^(?:(\\d+)\\.)?(?:(\\d+)\\.)?(\\*|\\d+)$':
                isRelease = true
                VERSION = BRANCH_NAME
                BUILD_VERSION = BRANCH_NAME
                break;
            case ~'^(?:(\\d+)\\.)?(?:(\\d+)\\.)?(\\*|\\d+)-RC?(\\d+)$':
                isRelease = false
                VERSION = BRANCH_NAME
                BUILD_VERSION = BRANCH_NAME
                break;
            default:
                VERSION = VERSION.replace('/', '-')
                BUILD_VERSION = "dev-${VERSION}-${BUILD_NUMBER}"
                break;
          }
        }
      }
    }
    stage('Build zeus-auth-webserver') { 
      steps { 
        script{
          dir("zeus-auth-webserver") {
            ah_ss_proxy = docker.build("${CONTAINER_REGISTRY}/zeus-auth-webserver")
          }
        } 
      }
    }
  }
}
