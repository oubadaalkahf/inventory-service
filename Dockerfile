FROM maven as inventory
COPY . /inventoryservice/

WORKDIR /inventoryservice

RUN mvn package -Dmaven.test.skip

FROM openjdk
COPY --from=inventory /inventoryservice/target/*.jar /inventoryservice/app.jar
EXPOSE 9090

#s'execute au lancement de l'image d'un container de l'image (docker run)
CMD ["java", "-jar", "/inventoryservice/app.jar"]