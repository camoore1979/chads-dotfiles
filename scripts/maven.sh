
## move this later elsewhere
my_maven-migrate() {
  docker run -it --rm \
    --name maven-runner \
    -v "$(pwd)":/usr/src/mymaven \
    -w /usr/src/mymaven \
    maven:3.6.2-jdk-11 \
    mvn liquibase:update \
      -Dliquibase.username=polaris \
      -Dliquibase.password=password \
      -Dliquibase.url=jdbc:${1:-"postgresql://host.docker.internal:5434/hps"}
}