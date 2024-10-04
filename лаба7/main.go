package main

import (
	"context"
	"lab7-web-services/proto"
	"lab7-web-services/repository"
	"log"
	"net"

	"google.golang.org/grpc"
)

type myModeratorServer struct {
	proto.UnimplementedModeratorServer
}

var commentaryRepository repository.CommentaryRepository = repository.New()

func (s myModeratorServer) PromoteToModerator(ctx context.Context, req *proto.ModeratorRequest) (*proto.ModeratorResponse, error) {
	requestId := req.GetParticipantId()
	commentaryRepository.AddModeratorStatus(int(requestId))
	participant := commentaryRepository.FindOne(int(requestId))
	return &proto.ModeratorResponse{
		Id:       uint32(participant.Id),
		Name:     participant.Name,
		Email:    participant.Email,
		Password: participant.Password,
		Status:   uint32(participant.Status),
		Role:     uint32(participant.Role),
		Avatar:   participant.Avatar,
	}, nil
}

func (s myModeratorServer) DemoteToUser(ctx context.Context, req *proto.ModeratorRequest) (*proto.ModeratorResponse, error) {
	requestId := req.GetParticipantId()
	commentaryRepository.RemoveModeratorStatus(int(requestId))
	participant := commentaryRepository.FindOne(int(requestId))
	return &proto.ModeratorResponse{
		Id:       uint32(participant.Id),
		Name:     participant.Name,
		Email:    participant.Email,
		Password: participant.Password,
		Status:   uint32(participant.Status),
		Role:     uint32(participant.Role),
		Avatar:   participant.Avatar,
	}, nil
}

func main() {
	lis, err := net.Listen("tcp", ":8089")
	if err != nil {
		log.Fatalf("Cannot create listener %s", err)
	}

	serverRegister := grpc.NewServer()
	service := &myModeratorServer{}

	log.Println("GRPC server on http://localhost:8089/")

	proto.RegisterModeratorServer(serverRegister, service)
	err = serverRegister.Serve(lis)
	if err != nil {
		log.Fatalf("impossible to serve: %s", err)
	}

}
