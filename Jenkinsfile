pipeline {
  agent {
    dockerfile {
      filename 'file'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''echo Building
export KERNEL=kernel7l
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf
make bcm2711_defconfig

'''
      }
    }

  }
}