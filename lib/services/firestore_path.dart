class FirestorePath {
  static String job(String uid, String jobId) => 'users/$uid/jobs/$jobId';
  static String jobs(String uid) => 'users/$uid/jobs';
  static String entry(String uid, String entryId) =>
      'users/$uid/entries/$entryId';
  static String entries(String uid) => 'users/$uid/entries';
  static String assignments(String uid) => 'assignments';
  static String projects(String uid) => 'projects';
  static String shifts(String uid) => 'shifts';
  static String users(String uid) => 'users';
}
