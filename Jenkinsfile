pipeline {
    agent any
    
    triggers {
        githubPush()
    }

    stages {

        stage('Clone Respository') {
            steps {
                sh '''  
                    #!/bin/bash
                    cd /home/arthur/Desktop/jenkins-tmp-dir
                    git clone https://github.com/ArthurWuTW/docker-java-weblogic-eclipse
                    cp ./3party/eclipse-jee-2020-03-R-incubation-linux-gtk-x86_64.tar.gz ./docker-java-weblogic-eclipse/dependencies/eclipse/
                    cp ./3party/fmw_12.1.3.0.0_wls.jar ./docker-java-weblogic-eclipse/dependencies/oracle/
                    cp ./3party/jdk-8u291-linux-x64.tar.gz ./docker-java-weblogic-eclipse/dependencies/oracle/
                '''
            }
        }

        stage('Copy 3Party Package') {
            steps {
                sh '''  
                    #!/bin/bash
                    cd /home/arthur/Desktop/jenkins-tmp-dir
                    cp ./3party/eclipse-jee-2020-03-R-incubation-linux-gtk-x86_64.tar.gz ./docker-java-weblogic-eclipse/dependencies/eclipse/
                    cp ./3party/fmw_12.1.3.0.0_wls.jar ./docker-java-weblogic-eclipse/dependencies/oracle/
                    cp ./3party/jdk-8u291-linux-x64.tar.gz ./docker-java-weblogic-eclipse/dependencies/oracle/
                '''
            }
        }

        stage('Stop Container') {
            steps {
                sh '''  
                    #!/bin/bash
                    cd /home/arthur/Desktop/jenkins-tmp-dir
                    cd ./docker-java-weblogic-eclipse/docker
                    ./project-stop-container || echo 'No container started!'
                '''
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh '''  
                    #!/bin/bash
                    cd /home/arthur/Desktop/jenkins-tmp-dir
                    cd ./docker-java-weblogic-eclipse/docker
                    ./project-build-image
                '''
            }
            
        }
        
        stage('Start Container') {
            steps {
                sh '''  
                    #!/bin/bash
                    cd /home/arthur/Desktop/jenkins-tmp-dir
                    cd ./docker-java-weblogic-eclipse/docker
                    ./project-start-container
                '''
            }
        }

        stage('Delete Temp Repo') {
            steps {
                sh '''  
                    #!/bin/bash
                    cd /home/arthur/Desktop/jenkins-tmp-dir
                    rm -r ./docker-java-weblogic-eclipse
                '''
            }
        }
    }
}
