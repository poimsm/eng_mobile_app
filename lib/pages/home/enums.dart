enum SentenceActionStep {
  sentence,
  meaning,
  example,
}

enum ChallengeStates {
  instructions,
  accepted,
  meaning,
  example,
}

enum Audio {
  saved,
  recording,
  meaning,
  example,
}

enum ActivityTypes {
  question,
  describeImage
}

enum RecordStages {
  recording,
  haveNewAudioSaved,
  userHaveCancelledRecording,
  example,
}
