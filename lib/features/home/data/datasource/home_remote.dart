part of 'ihome_remote.dart';

@Injectable(as: IHomeRemoteSource)
class HomeRemoteSource extends IHomeRemoteSource {
  @override
  Future<Either<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
      responseValidator: TestResponseValidator(),
    );
  }

  @override
  Future<Either<AppErrors, PeopleDataModel>> getPeople(
      MockRequest mockRequest) {
    return request<PeopleDataModel>(
      converter: (json) => PeopleDataModel.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, List<CommentsModel>>> getComments() {
    return listRequest<CommentsModel>(
      converter: (json) => CommentsModel.fromJson(json),
      method: HttpMethod.GET,
      url: APIUrls.API_JP_COMMENTS,
      baseUrl: APIUrls.BASE_JSON_PLACEHOLDER,
    );
  }

  /////////////

  @override
  Future<Either<AppErrors, List<PostModel>>> getPosts(NoParams params) async {
    await Future.delayed(const Duration(seconds: 2));

    final posts = [
      PostModel(
        id: 1,
        userImage: "https://picsum.photos/200",
        userName: "John Doe",
        content: "Beautiful day at the beach! 🌊",
        likes: 234,
        comments: ["Awesome!", "Great shot!", "Wish I was there"],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        mediaList: [
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/600",
          ),
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/601",
          ),
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/600",
          ),
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/601",
          ),
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/600",
          ),
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/601",
          ),
        ],
      ),
      PostModel(
        id: 2,
        userImage: "https://picsum.photos/201",
        userName: "Jane Smith",
        content: "Check out my new vlog! 🎥",
        likes: 567,
        comments: ["Nice video!", "Great content", "Keep it up"],
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
        mediaList: [
          MediaModel(
            type: MediaType.video.value,
            url:
                "https://videos.pexels.com/video-files/1409899/1409899-uhd_2560_1440_25fps.mp4",
          ),
        ],
      ),
      PostModel(
        id: 3,
        userImage: "https://picsum.photos/202",
        userName: "Mike Johnson",
        content: "Photo shoot from yesterday 📸",
        likes: 789,
        comments: ["Amazing photos!", "You're so talented", "Love these"],
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
        mediaList: [
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/603",
          ),
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/604",
          ),
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/605",
          ),
        ],
      ),
      PostModel(
        id: 4,
        userImage: "https://picsum.photos/204",
        userName: "Emma Davis",
        content: "Just a simple thought for today 💭",
        likes: 45,
        comments: ["So true!", "Well said", "Thanks for sharing"],
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
        mediaList: [],
      ),
      PostModel(
        id: 5,
        userImage: "https://picsum.photos/205",
        userName: "Sarah Williams",
        content: "My new painting 🎨",
        likes: 156,
        comments: ["Beautiful work!", "Love the colors", "You're so talented"],
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
        mediaList: [
          MediaModel(
            type: MediaType.image.value,
            url: "https://picsum.photos/800/606",
          ),
        ],
      ),
    ];

    return right(posts);
  }

  @override
  Future<Either<AppErrors, List<StoryModel>>> getStories(
      NoParams params) async {
    await Future.delayed(const Duration(seconds: 2));
    final dummyStories = [
      StoryModel(
        id: 1,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                "https://videos.pexels.com/video-files/1409899/1409899-uhd_2560_1440_25fps.mp4",
            type: MediaType.video.value,
          ),
        ],
        title: 'My Story',
        subtitle: 'Just now',
        userName: 'John Doe',
        userImage: 'https://i.pravatar.cc/150?img=1',
        createdAt: DateTime.now(),
      ),
      StoryModel(
        id: 2,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
            type: MediaType.video.value,
          ),
        ],
        title: 'Beach Day',
        subtitle: '2h ago',
        userName: 'Jane Smith',
        userImage: 'https://i.pravatar.cc/150?img=2',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      StoryModel(
        id: 3,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1497935586351-b67a49e012bf?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=775&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                "https://videos.pexels.com/video-files/1409899/1409899-uhd_2560_1440_25fps.mp4",
            type: MediaType.video.value,
          ),
        ],
        title: 'Coffee Time',
        subtitle: '5h ago',
        userName: 'Mike Wilson',
        userImage: 'https://i.pravatar.cc/150?img=3',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      StoryModel(
        id: 4,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1418065460487-3e41a6c84dc5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
            type: MediaType.video.value,
          ),
        ],
        title: 'My Story',
        subtitle: 'Just now',
        userName: 'John Doe',
        userImage: 'https://i.pravatar.cc/150?img=1',
        createdAt: DateTime.now(),
      ),
      StoryModel(
        id: 5,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1431794062232-2a99a5431c6c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
            type: MediaType.video.value,
          ),
        ],
        title: 'Beach Day',
        subtitle: '2h ago',
        userName: 'Jane Smith',
        userImage: 'https://i.pravatar.cc/150?img=2',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      StoryModel(
        id: 6,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
            type: MediaType.video.value,
          ),
        ],
        title: 'Coffee Time',
        subtitle: '5h ago',
        userName: 'Mike Wilson',
        userImage: 'https://i.pravatar.cc/150?img=3',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      StoryModel(
        id: 7,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
            type: MediaType.video.value,
          ),
        ],
        title: 'My Story',
        subtitle: 'Just now',
        userName: 'John Doe',
        userImage: 'https://i.pravatar.cc/150?img=1',
        createdAt: DateTime.now(),
      ),
      StoryModel(
        id: 8,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
            type: MediaType.video.value,
          ),
        ],
        title: 'Beach Day',
        subtitle: '2h ago',
        userName: 'Jane Smith',
        userImage: 'https://i.pravatar.cc/150?img=2',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      StoryModel(
        id: 9,
        media: [
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1465146344425-f00d5f5c8f07?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
            type: MediaType.image.value,
          ),
          MediaModel(
            url:
                'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
            type: MediaType.video.value,
          ),
        ],
        title: 'Coffee Time',
        subtitle: '5h ago',
        userName: 'Mike Wilson',
        userImage: 'https://i.pravatar.cc/150?img=3',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
    ];

    return right(dummyStories);
  }
}
