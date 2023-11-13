{
  ...
}: {
  programs.git = {
    enable = true;
    userName  = "daslastic";
    userEmail = "daslastic@gmail.com";
  };

 home.file.".local/bin/yonk" = {
   source = ./yonk;
   executable = true;
 };
}
