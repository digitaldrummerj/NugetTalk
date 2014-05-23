<Query Kind="Expression">
  <Connection>
    <ID>8e54e281-fdb0-4dc0-bca6-43d3dcd732c6</ID>
    <Persist>true</Persist>
    <Driver>AstoriaAuto</Driver>
    <Server>https://www.nuget.org/api/v2/</Server>
  </Connection>
</Query>

// Look at the Request Log Tab to get url to put into IE browser to seed feed results.
from x in Packages
orderby x.LastUpdated descending 
where x.LastUpdated > DateTime.Now.AddDays(-1)
select new
{
	x.Id,
	Tags = x.Tags,
	Title = x.Title,
	Description = x.Description,
	ProjectUrl = x.ProjectUrl,
	GalleryDetailurl = x.GalleryDetailsUrl,
	Version = x.Version,
	LastUpdated = x.LastUpdated				
}
