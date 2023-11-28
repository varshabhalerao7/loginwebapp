pipeline {
    agent {
        label{
            label "built-in"
            customWorkspace "/mnt/hsk"
            
        }
    }
    tools {
        maven "MAVEN_HOME"
    }
    stages {
        stage ("clone") {
            steps {
               git credentialsId: 'git', url: 'https://github.com/HEMANT-111/loginwebapp.git'
            }
           }
           stage ("build") {
               steps {
                   sh "mvn clean install"
               }
           }
           stage ("deploy") {
               steps {
                   sh "cp ./target/*.war /mnt/tom/apache-tomcat-9.0.83/webapps "
               }
           }
    }
}
