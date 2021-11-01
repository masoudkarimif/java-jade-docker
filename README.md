This is the source Dockerfile for the [`masoudkf/jade-java`](https://hub.docker.com/repository/docker/masoudkf/java-jade) repository on DockerHub. The image can be used for both compiling and running [JADE](https://en.wikipedia.org/wiki/Java_Agent_Development_Framework)-based applications.

## Compile

Pull the image:

```bash
docker pull masoudkf/java-jade
```

Move to your project directory:

```bash
cd <Your-Project-Directory>
```

Write your agent:

```bash
cat >./HelloWorld.java <<EOL
import jade.core.Agent;

public class HelloWorld extends Agent
{
    protected void setup()
    {
        System.out.println("Hello World!");
        System.out.println("My name is "+ getLocalName());
    }
}
EOL
```

Compile your files:

```bash
docker run -v $(pwd):/app --name jade-test --rm masoudkf/java-jade
```

This will put the compiled files in the current directory. The default command is `javac -d . *.java`. If you want to run a different command for compiling, you can add it to the command above. You can also add files to the `CLASSPATH` environment variable by passing the `CP` env in the run command.

```bash
docker run -v $(pwd):/app --name jade-test -e CP=./mylib.jar --rm masoudkf/java-jade javac MyFile.java
```

## Run

Run this command after compiling your files:

```bash
docker run -v $(pwd):/app --name jade-test --rm masoudkf/java-jade java jade.Boot -agents hwagent:HelloWorld
```

You should see this output:

```
Hello World!
My name is hwagent
```
