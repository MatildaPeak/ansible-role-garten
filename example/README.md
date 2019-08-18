# Example directory
A set of files to experiment with the role, allowing user-testing
prior to commit/publication. With a suitable environment, and
something like [minikube] running, from this directory you can run: -

    source activate my-env
    pip install -r requirements.txt
    ./kube-up.sh

And to clean-up: -

    ./kube-down.sh

---

[minikube]: https://kubernetes.io/docs/tasks/tools/install-minikube
