to run
```
    # 1. Clear out the isolated pod instance
    podman pod rm -f obico-pod 2>/dev/null

    # 2. Fire up using the native YAML parameters
    podman play kube obico-stack.yaml --configmap env-stage.yaml
```

to compose down:
podman compose down


for onboarding of the database:

```

# 1. Run the core schema migrations to create all required tables
podman exec -it obico-pod-obico-web python3 manage.py migrate --run-syncdb

# 2. Run the specific obico site initialization script to populate the django_site table
podman exec -it obico-pod-obico-web python3 manage.py initialize_site

# 3. Clear the internal application cache so Django picks up the new database entries
podman exec -it obico-pod-obico-web python3 manage.py clear_cache
```


run this to open interactive user cretion wizard
```
podman exec -it obico-pod-obico-web python3 manage.py createsuperuser
```
