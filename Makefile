TARGET_DIR := "target"
BINARY_NAME := "MobyArtShop-0.0.1-SNAPSHOT.jar"
SRC_DIR := $(shell pwd)


$(TARGET_DIR):
	mkdir -p target


$(TARGET_DIR)/$(BINARY_NAME): $(TARGET_DIR)
	docker run -ti -v $(SRC_DIR):/mobyartshop -w /mobyartshop maven:alpine mvn package -DskipTests


binary: $(TARGET_DIR)/$(BINARY_NAME)


images: binary
	docker-compose build

clean:
	rm -rf $(TARGET_DIR)

