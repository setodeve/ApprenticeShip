class Playlist {
  name: string;
  songs: string[];
  playing: string;

  constructor(name: string) {
    this.name = name;
    this.songs = [];
    this.playing = "";
  }

  addSong(song: string): void {
    this.songs.push(song);
  }

  play(): string {
    return this.songs[0];
  }

  removeSong(song: string): void {
    const index = this.songs.indexOf(song);
    this.songs.splice(index, 1);
  }
}

const myPlaylist = new Playlist("お気に入りリスト");
myPlaylist.addSong("Lemon");
myPlaylist.addSong("花束");
console.log(myPlaylist.play()); // 再生中: Lemon
myPlaylist.removeSong("Lemon");
console.log(myPlaylist.play()); // 再生中：花束
