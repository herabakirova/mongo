node {
    stage ("Create secret") {
        sh "kubectl apply -f secret.yaml"
    }
    stage ("Create deployment") {
        sh "kubectl apply -f deploy.yaml"
    }
    
    stage("Create service") {
        sh "kubectl apply -f service.yaml"
    }
}