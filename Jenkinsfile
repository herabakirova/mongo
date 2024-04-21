template = '''
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: kubectl
  name: kubectl
spec:
  serviceAccount: kubernetes
  containers:
  - command:
    - sleep
    - "3600"
    image: herabakirova/kubectl:1.0
    imagePullPolicy: Always
    name: kubectl
'''

podTemplate(cloud: 'kubernetes', label: 'kubectl', yaml: template) {
  node ("kubectl") {
    container ("kubectl") {
    stage ("Checkout SCM") {
        git branch: 'main', url: 'https://github.com/herabakirova/mongo.git'
    }
    stage ("Create mongo") {
        sh '''
        kubectl apply -f secret.yaml
        kubectl apply -f deploy.yaml
        kubectl apply -f configmap.yaml
        kubectl apply -f mongo-x.yaml
        '''
    }
}
}
}
