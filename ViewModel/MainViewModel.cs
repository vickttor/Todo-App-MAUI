using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using System.Collections.ObjectModel;

namespace maui.ViewModel;

public partial class MainViewModel : ObservableObject
{
  public MainViewModel()
  {
    Items = new ObservableCollection<string>();
  }

  [ObservableProperty]
  ObservableCollection<string> items;

  [ObservableProperty]
  string text;

  [RelayCommand]
  void Add()
  {
    if(string.IsNullOrWhiteSpace(Text))
      return;
      
    Items.Add(text);
    // Add our item
    Text = string.Empty;
  }

  [RelayCommand]
  void Delete(string s)
  {
    if(Items.Contains(s))
    {
      Items.Remove(s);
    }
  }
}

// Raw way:

/* public class MainViewModel : INotifyPropertyChanged
{
  string text;

  public string Text
  {
    get => text;
    set 
    {
      text = value;
      OnPropertyChanged(nameof(Text));
    }
  }
    public event PropertyChangedEventHandler? PropertyChanged;
    void OnPropertyChanged(string name) =>
      PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
} */