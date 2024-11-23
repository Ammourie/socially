import '../../../../../di/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/models/empty_response.dart';
import '../../../../../core/params/no_params.dart';
import '../../../data/request/param/mock_request.dart';
import '../../../data/request/model/people_model.dart';
import '../../../domain/entity/comments_entity.dart';
import '../../../domain/entity/people_entity.dart';
import '../../../domain/entity/post_entity.dart';
import '../../../domain/entity/story_entity.dart';
import '../../../domain/usecase/comments_usecase.dart';
import '../../../domain/usecase/get_people_usecase.dart';
import '../../../domain/usecase/get_posts_usecase.dart';
import '../../../domain/usecase/get_stories_usecase.dart';
import '../../../domain/usecase/test_success_usecase.dart';
import '../../../domain/usecase/test_validator_usecase.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.homeInitState());

  void testSuccess() async {
    emit(const HomeState.homeLoadingState());

    final result = await getIt<TestSuccessUseCase>().call(
      MockRequest(
        token: AppConstants.MOCK_JSON_TOKEN,
        data: MockRequestData(
          message: "Success test message 😎 💪",
          succeed: true,
        ),
      ),
    );

    result.pick(
      onData: (data) {
        emit(HomeState.homeLoadedState(result.data!));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(result.error!, () => this.testSuccess()));
      },
    );
  }

  void testFailure() async {
    emit(const HomeState.homeLoadingState());

    final result = await getIt<TestSuccessUseCase>().call(
      MockRequest(
        token: AppConstants.MOCK_JSON_TOKEN,
        data: MockRequestData(
          message: "Failure test message 😎 💪",
          succeed: false,
        ),
      ),
    );

    result.pick(
      onData: (data) {
        emit(HomeState.homeLoadedState(result.data!));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(result.error!, () => this.testSuccess()));
      },
    );
  }

  void testValidator() async {
    emit(const HomeState.homeLoadingState());

    final result = await getIt<TestValidatorUseCase>().call(
      MockRequest(
        token: AppConstants.MOCK_JSON_TOKEN,
        data: MockRequestData(
          message: "Failure test message 😎 💪",
          succeed: false,
        ),
      ),
    );

    result.pick(
      onData: (data) {
        emit(HomeState.homeLoadedState(result.data!));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(result.error!, () => this.testSuccess()));
      },
    );
  }

  void getPeople() async {
    emit(const HomeState.homeLoadingState());

    final result = await getIt<GetPeopleUseCase>().call(
      MockRequest(
        token: AppConstants.MOCK_JSON_TOKEN,
        data: PeopleDataModel(
          message: "Success",
          succeed: true,
          people: [
            PersonModel(
              name: "AliY",
              age: 24,
            ),
            PersonModel(
              name: "Issa",
              age: 24,
            ),
            PersonModel(
              name: "AliD",
              age: 24,
            ),
          ],
        ),
      ),
    );

    result.pick(
      onData: (data) {
        emit(HomeState.peopleListLoadedState(result.data!));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(result.error!, () => this.getPeople()));
      },
    );
  }

  void getComments() async {
    emit(const HomeState.homeLoadingState());

    final result = await getIt<CommentsUseCase>().call(NoParams());

    result.pick(
      onData: (data) {
        emit(HomeState.commentsLoadedState(result.data!));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(result.error!, () => this.getComments()));
      },
    );
  }

  void getPosts() async {
    emit(const HomeState.homeLoadingState());

    final result = await getIt<GetPostsUseCase>().call(NoParams());
    result.pick(
      onData: (data) {
        emit(HomeState.postsLoadedState(result.data!));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(result.error!, () => this.getPosts()));
      },
    );
  }

  void getStories() async {
    emit(const HomeState.homeLoadingState());

    final result = await getIt<GetStoriesUseCase>().call(NoParams());

    result.pick(
      onData: (data) {
        emit(HomeState.storiesLoadedState(result.data!));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(error, () => this.getStories()));
      },
    );
  }
}
