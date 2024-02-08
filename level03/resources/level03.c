int main(int argc, char **argv, char **envp)
{
  **gid_t **rgid;
  **uid_t **ruid;
  int iVar1;
  gid_t gid;
  uid_t uid;
  
  **rgid = getegid();
  **ruid = geteuid();
  setresgid(**rgid, **rgid, **rgid);
  setresuid(**ruid, **ruid, **ruid);
  iVar1 = system("/usr/bin/env echo Exploit me");
  return iVar1;
}