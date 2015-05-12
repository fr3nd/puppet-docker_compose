include docker_compose
docker_compose::application { 'foo':
  content => "---\ntest:\n  image: redis:latest\n",
}
