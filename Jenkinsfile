pipeline {
  agent any
  environment {
    GCLOUD_PATH = "/usr/lib64/google-cloud-sdk/bin"
    PATH = "$PATH:$GCLOUD_PATH"
  
    GCLOUD_SVC_ACCOUNT_KEYFILE = sh(script: 'unset CURL_CA_BUNDLE; /usr/lib64/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file ./serviceaccount.json; unset CURL_CA_BUNDLE; /usr/lib64/google-cloud-sdk/bin/gcloud auth print-access-token', returnStdout: true).trim()
   
    GOOGLE_APPLICATION_CREDENTIALS = "/tmp/jenkins_sa.json"
  }
  parameters {
    string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
    string(name: 'build_version', defaultValue: '', description: 'Version variable to pass to Terraform')
  }
  stages {
    stage('Plan') {
      steps {
        sh '''
          terraform init -input=false -no-color
          terraform plan -no-color -input=false -out tfplan
          terraform show -no-color tfplan > tfplan.txt
        '''
      }
    }
    stage('Approve') {
      steps {
        script {
          input message: "Do you want to apply the plan?",
            parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: 'no')]
        }
      }
    }
    stage('Apply') {
      steps {
        sh '''
          # IF WE DONT UNSET THIS THEN GCLOUD FAILS ALL OVER THE PLACE
          unset CURL_CA_BUNDLE
          terraform apply -no-color -input=false tfplan
        '''
      }
    }
  }
  post {
    always {
    
      archiveArtifacts artifacts: 'tfplan.txt'
    }
  }
}
