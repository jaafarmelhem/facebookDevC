package com.example.facebook.manager;

import com.example.facebook.model.AccessType;
import com.example.facebook.model.PlayList;

import java.util.List;

public interface PlayListManager {

    public List<PlayList> getAllPlayLists();

    public List<PlayList> getAllPlayListsByUserId(Integer Id);

    public PlayList createPlaylist(String title , Integer userId);

    public void grantAccess(Integer playListId, Integer userId);

    public void removeAccess(Integer playListId, Integer user );




}
