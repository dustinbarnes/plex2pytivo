#!/bin/bash

pushd build

rm -rf media.html

echo '<table>' >> media.html

sqlite3 -html com.plexapp.plugins.library.db "select items.hints, parts.file, meta.summary, meta.year, meta.originally_available_at, meta.title from media_items items join media_parts parts on (parts.media_item_id = items.id) join metadata_items meta on (items.metadata_item_id = meta.id)" >> media.html

echo '</table>' >> media.html

popd
