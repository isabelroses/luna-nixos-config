{pkgs, ...}: {
  home.packages = with pkgs; [vimiv-qt];

  xdg.configFile = {
    "vimiv/vimiv.conf".text = ''
      [GENERAL]
      monitor_filesystem = True
      startup_library = True
      style = gruvbox
      read_only = False

      [COMMAND]
      history_limit = 100

      [COMPLETION]
      fuzzy = False

      [SEARCH]
      ignore_case = True
      incremental = True

      [IMAGE]
      autoplay = True
      autowrite = ask
      overzoom = 1.0
      zoom_wheel_ctrl = True

      [LIBRARY]
      width = 0.3
      show_hidden = False

      [THUMBNAIL]
      size = 128
      save = True

      [SLIDESHOW]
      delay = 2.0
      indicator = slideshow:

      [STATUSBAR]
      collapse_home = True
      show = True
      message_timeout = 60000
      mark_indicator = <b>*</b>
      left = {pwd}{read-only}
      left_image = {index}/{total} {basename}{read-only} [{zoomlevel}]
      left_thumbnail = {thumbnail-index}/{thumbnail-total} {thumbnail-basename}{read-only}
      left_manipulate = {basename}   {image-size}   Modified: {modified}   {processing}
      center_thumbnail = {thumbnail-size}
      center = {slideshow-indicator} {slideshow-delay} {transformation-info}
      right = {keys}  {mark-count}  {mode}
      right_image = {keys}  {mark-indicator} {mark-count}  {mode}

      [KEYHINT]
      delay = 500
      timeout = 5000

      [TITLE]
      fallback = vimiv
      image = vimiv - {basename}

      [METADATA]
      keys1 = Exif.Image.Make,Exif.Image.Model,Exif.Photo.LensModel,Exif.Image.DateTime,Exif.Image.Artist,Exif.Image.Copyright
      keys2 = Exif.Photo.ExposureTime,Exif.Photo.FNumber,Exif.Photo.ISOSpeedRatings,Exif.Photo.ApertureValue,Exif.Photo.ExposureBiasValue,Exif.Photo.FocalLength,Exif.Photo.ExposureProgram
      keys3 = Exif.GPSInfo.GPSLatitudeRef,Exif.GPSInfo.GPSLatitude,Exif.GPSInfo.GPSLongitudeRef,Exif.GPSInfo.GPSLongitude,Exif.GPSInfo.GPSAltitudeRef,Exif.GPSInfo.GPSAltitude
      keys4 = Iptc.Application2.Caption,Iptc.Application2.Keywords,Iptc.Application2.City,Iptc.Application2.SubLocation,Iptc.Application2.ProvinceState,Iptc.Application2.CountryName,Iptc.Application2.Source,Iptc.Application2.Credit,Iptc.Application2.Copyright,Iptc.Application2.Contact
      keys5 = Exif.Image.ImageWidth,Exif.Image.ImageLength,Exif.Photo.PixelXDimension,Exif.Photo.PixelYDimension,Exif.Image.BitsPerSample,Exif.Image.Compression,Exif.Photo.ColorSpace

      [SORT]
      image_order = alphabetical
      directory_order = alphabetical
      reverse = False
      ignore_case = False
      shuffle = False

      [PLUGINS]
      print = default
      metadata = default

      [ALIASES]
    '';

    "vimiv/styles/gruvbox".text = ''
      [STYLE]
      base00 = #1d2021
      base01 = #3c3836
      base02 = #504945
      base03 = #665c54
      base04 = #bdae93
      base05 = #d5c4a1
      base06 = #ebdbb2
      base07 = #fbf1c7
      base08 = #fb4934
      base09 = #fe8019
      base0a = #fabd2f
      base0b = #b8bb26
      base0c = #8ec07c
      base0d = #83a598
      base0e = #d3869b
      base0f = #d65d0e
    '';
  };
}
