abstract class SocialState {}

class InitialSocailState extends SocialState{}

class ChangeCurrentIndexState extends SocialState{}

class GetUserDataSuccess extends SocialState{}

class GetUserDataError extends SocialState{}

class UploadProfileImageSuccess extends SocialState{}

class UploadProfileImageError extends SocialState{}

class UploadCoverImageSuccess extends SocialState{}

class UploadCoverImageError extends SocialState{}

class UpdateUserDataSuccess extends SocialState{}

class UpdateUserDataError extends SocialState{}

class LoadingUpdateData extends SocialState{}


//create post

class SocialCreatePostLoadingState extends SocialState{}

class SocialCreatePostSuccessState extends SocialState{}

class SocialCreatePostErrorState extends SocialState{}

class RemovePostImageState extends SocialState{}

//get posts

class SocailGetPostLoadingsState extends SocialState{}

class SocailGetPostSuccessState extends SocialState{}

class SocailGetPostErrorState extends SocialState{}

//likes

class LikePostSuccessState extends SocialState{}

class LikePostErrorState extends SocialState{}

//Get all users

class GetAllUserSuccessState extends SocialState{}
class GetAllUserErrorState extends SocialState{}

//chats

class SendMessgaeSuccessState extends SocialState{}

class SendMessageErrorState extends SocialState{}

class GetMessageSuccessState extends SocialState{}

class GetMessageErrorState extends SocialState{}




