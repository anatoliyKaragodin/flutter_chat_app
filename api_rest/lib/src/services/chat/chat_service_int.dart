abstract class IChatService {
  createChat({required int friend1Id, required int friend2Id});
  updateChat({required String newValues, required String condition});
  deleteChat({required int id});
  getChatById({required int id});
  getAllChats();
  getChatByTwoIds({required int friend1Id, required int friend2Id});
  getChatsByUserId({required int userId});
}
