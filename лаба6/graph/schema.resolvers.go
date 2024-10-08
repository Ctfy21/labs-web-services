package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.54

import (
	"context"

	"github.com/Ctfy21/lab6-web-services/graph/model"
	"github.com/Ctfy21/lab6-web-services/repository"
)

var commentaryRepository repository.CommentaryRepository = repository.New()

// AddLike is the resolver for the addLike field.
func (r *mutationResolver) AddLike(ctx context.Context, commentartyID int) (*model.Commentary, error) {
	err := commentaryRepository.AddLike(commentartyID)
	if err != nil {
		return nil, err
	}
	return commentaryRepository.FindOne(commentartyID), nil
}

// RemoveLike is the resolver for the removeLike field.
func (r *mutationResolver) RemoveLike(ctx context.Context, commentartyID int) (*model.Commentary, error) {
	err := commentaryRepository.RemoveLike(commentartyID)
	if err != nil {
		return nil, err
	}
	return commentaryRepository.FindOne(commentartyID), nil
}

// Commentaries is the resolver for the commentaries field.
func (r *queryResolver) Commentaries(ctx context.Context) ([]*model.Commentary, error) {
	return commentaryRepository.FindAll(), nil
}

// Mutation returns MutationResolver implementation.
func (r *Resolver) Mutation() MutationResolver { return &mutationResolver{r} }

// Query returns QueryResolver implementation.
func (r *Resolver) Query() QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }

// !!! WARNING !!!
// The code below was going to be deleted when updating resolvers. It has been copied here so you have
// one last chance to move it out of harms way if you want. There are two reasons this happens:
//  - When renaming or deleting a resolver the old code will be put in here. You can safely delete
//    it when you're done.
//  - You have helper methods in this file. Move them out to keep these resolver files clean.
/*
	var commentaryRepository repository.CommentaryRepository = repository.New()
*/
