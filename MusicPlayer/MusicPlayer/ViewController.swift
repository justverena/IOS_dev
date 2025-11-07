//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Verena Gaaze on 07.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var currentTrackIndex = 0
    var isPlaying = false
    var timer: Timer?
    
    struct Track {
        let title: String
        let imageName: String
        let fileName: String
    }

    var tracks: [Track] = [
        Track(title: "Ride", imageName: "Ride", fileName: "Ride"),
        Track(title: "Choker", imageName: "Choker", fileName: "Choker"),
        Track(title: "Trapdoor", imageName: "Trapdoor", fileName: "Trapdoor"),
        Track(title: "Vignette", imageName: "Vignette", fileName: "Vignette"),
        Track(title: "Downstairs", imageName: "Downstairs", fileName: "Downstairs"),
        Track(title: "Chlorine", imageName: "Chlorine", fileName: "Chlorine"),
        Track(title: "Migraine", imageName: "Migraine", fileName: "Migraine")
    ]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareTrack()
        progressSlider.minimumValue = 0
        progressSlider.maximumValue = 1
        progressSlider.value = 0
    }
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        if isPlaying {
            pauseTrack()
        } else {
            pauseOrPlayTrack()
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex + 1) % tracks.count
        playTrack()
    }
    
    @IBAction func prevTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
        playTrack()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        guard let player = player else { return }
        let newTime = Double(sender.value) * player.duration
        player.currentTime = newTime
        currentTimeLabel.text = formatTime(newTime)
    }

    func updateUI() {
        let track = tracks[currentTrackIndex]
        titleLabel.text = track.title
        coverImageView.image = UIImage(named: track.imageName)
        currentTimeLabel.text = "0:00"
        progressSlider.value = 0
        totalTimeLabel.text = "--:--"
    }

    func prepareTrack() {
        let track = tracks[currentTrackIndex]
        guard let url = Bundle.main.url(forResource: track.fileName, withExtension: "mp3") else {
            print("Error: Could not find file \(track.fileName).mp3")
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
        totalTimeLabel.text = formatTime(player?.duration ?? 0)
    }
    
    func playTrack() {
        stopTimer()
        let track = tracks[currentTrackIndex]
        updateUI()
        
        guard let url = Bundle.main.url(forResource: track.fileName, withExtension: "mp3") else {
            print("Error: Could not find file \(track.fileName).mp3")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
            isPlaying = true
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            totalTimeLabel.text = formatTime(player?.duration ?? 0)
            startTimer()
        } catch {
            print("Error loading \(track.fileName): \(error.localizedDescription)")
        }
    }

    func pauseOrPlayTrack() {
        if let player = player, !player.isPlaying {
            player.play()
            isPlaying = true
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            startTimer()
        } else {
            playTrack()
        }
    }
    
    func pauseTrack() {
        player?.pause()
        isPlaying = false
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        stopTimer()
    }

    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                guard let player = self.player else { return }
                let progress = Float(player.currentTime / player.duration)
                self.progressSlider.value = progress
                self.currentTimeLabel.text = self.formatTime(player.currentTime)
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
