generate_grpc_code:
	protoc --go_out=./ --go_opt=paths=source_relative --go-grpc_out=./ --go-grpc_opt=paths=source_relative proto/moderator.proto

start_server:
	go run main.go