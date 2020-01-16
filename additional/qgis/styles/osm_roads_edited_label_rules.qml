<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.3-Madeira" maxScale="0" simplifyDrawingHints="1" labelsEnabled="1" readOnly="0" minScale="1e+08" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="1" type="RuleRenderer" forceraster="0">
    <rules key="{57b0c703-ab34-4333-a1d3-8dab6272a095}">
      <rule label="motorway bridges" filter="highway IN ( 'motorway') AND  &quot;has_bridge&quot; = true" symbol="0" key="{8974c81b-f663-49e4-8ee3-e9a265664b1e}"/>
      <rule label="motorway" filter="highway IN ( 'motorway') " symbol="1" key="{7df0e623-dc67-4cbb-b451-4397f466c1c8}"/>
      <rule label="trunk bridges" filter="highway IN('trunk', 'motorway_link', 'trunk_link') AND  &quot;has_bridge&quot; = true" symbol="2" key="{98a3bdac-bbbd-491b-b420-eb720069289d}"/>
      <rule label="trunk" filter="highway IN ('trunk', 'motorway_link', 'trunk_link')" symbol="3" key="{43a655d2-deb2-4953-a019-f20ac40a3774}"/>
      <rule label="primary bridges" filter="highway IN ('primary','primary_link')  AND  &quot;has_bridge&quot; = true" symbol="4" key="{bcb033d9-9d00-4b86-9922-9a00464ce9c9}"/>
      <rule label="primary " filter="highway IN ('primary','primary_link')" symbol="5" key="{5b8ed0fe-4604-49cd-b845-36f873b8ffdc}"/>
      <rule label="secondary bridges" filter="highway IN ('secondary','secondary_link') AND  &quot;has_bridge&quot; = true" symbol="6" key="{eb3c8293-fadd-48ab-b772-74eb2d0a4e3c}"/>
      <rule label="secondary" filter="highway IN ('secondary','secondary_link')" symbol="7" key="{acd18072-8fd4-4586-a8f9-37f2f9027af8}"/>
      <rule label="tertiary bridges" filter="highway IN ('tertiary', 'tertiary_link') AND  &quot;has_bridge&quot; = true" symbol="8" key="{67d2921d-c5c0-47fd-b2fc-592901cb7118}"/>
      <rule label="tertiary " filter="highway IN ('tertiary', 'tertiary_link')" symbol="9" key="{da324c89-8fe4-499d-918c-03c31ff115fc}"/>
      <rule scalemindenom="50000" label="road bridges" filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')  AND  &quot;has_bridge&quot; = true" symbol="10" key="{de463268-1dcd-4c65-9af0-41d05df617e0}" scalemaxdenom="1000000"/>
      <rule scalemindenom="50000" label="road " filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')" symbol="11" key="{8c55cd70-562f-478f-a3ea-a4983fa7bc73}" scalemaxdenom="1000000"/>
      <rule scalemindenom="1" label="road bridges" filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')  AND  &quot;has_bridge&quot; = true" symbol="12" key="{79437746-bf53-4672-b0d2-e4bc487b8435}" scalemaxdenom="50000"/>
      <rule scalemindenom="1" label="road " filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')" symbol="13" key="{84e42e40-3161-4a51-817b-4db79efb1828}" scalemaxdenom="50000"/>
      <rule scalemindenom="1" label="service roads bridges" filter="highway IN ( 'service')  AND  &quot;has_bridge&quot; = true" symbol="14" key="{6527988f-57b9-4682-be66-a4042317f082}" scalemaxdenom="25000"/>
      <rule scalemindenom="5" label="service roads" filter="highway IN ( 'service')" symbol="15" key="{4055c2f0-9bb8-4533-8df2-81e8ab5cf3d7}" scalemaxdenom="25000"/>
      <rule scalemindenom="5" label="cycleway bridges" filter="highway = 'cycleway'  AND  &quot;has_bridge&quot; = true" symbol="16" key="{3f974e1a-d5eb-480c-919d-c98c2ee76297}" scalemaxdenom="25000"/>
      <rule scalemindenom="5" label="cycleway" filter="highway = 'cycleway'" symbol="17" key="{639293a2-a437-4819-9a7c-50c85daf131c}" scalemaxdenom="25000"/>
      <rule scalemindenom="5" label="track bridges" filter="highway IN ('track') AND  &quot;has_bridge&quot; = true" symbol="18" key="{922eb4a3-8021-43eb-93ef-af72217ada95}" scalemaxdenom="25000"/>
      <rule scalemindenom="5" label="track" filter="highway IN ('track')" symbol="19" key="{81c5dd98-1360-463f-a1f8-7f175316cf83}" scalemaxdenom="25000"/>
      <rule scalemindenom="5" label="path bridges" filter="highway IN ('path', 'footway') AND  &quot;has_bridge&quot; = true" symbol="20" key="{e092fd8f-08ae-4f94-ac46-3a049c8df969}" scalemaxdenom="25000"/>
      <rule scalemindenom="5" label="path" filter="highway IN ('path', 'footway')" symbol="21" key="{ea4cf320-b5ab-463d-8e02-eb998b0ddad3}" scalemaxdenom="25000"/>
      <rule label="train" filter="highway IN ('trainline')" symbol="22" key="{dadd86aa-d815-46f6-84bc-4f8d1b0ef6ee}"/>
      <rule label="tram" filter="highway IN ('tram')" symbol="23" key="{0eefb461-8dea-4f96-874e-6680b28cda1a}"/>
      <rule scalemindenom="1" label="one way" filter="car_oneway = 1 OR  bus_oneway = 1" symbol="24" key="{94758404-1fc1-445e-ad71-3c562850fd38}" scalemaxdenom="2500"/>
      <rule scalemindenom="5" label="steps" filter="highway IN ('steps')" symbol="25" key="{6c9976ae-f34f-437c-87d2-aa43626e6736}" scalemaxdenom="25000"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="line">
        <layer locked="0" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="12.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 12.3)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="232,146,162,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="9" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 9.0)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="1" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="12.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max( @map_scale / 1000, 12.3)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="6" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="232,146,162,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="9" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 9.0)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="10" type="line">
        <layer locked="1" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="207,207,207,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="3.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 2000, 3.3)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="11" type="line">
        <layer locked="1" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="207,207,207,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="3.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 2000, 3.3)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="12" type="line">
        <layer locked="1" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineStyle" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="type" value="1" type="int"/>
                  <Option name="val" value="" type="QString"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="13" type="line">
        <layer locked="1" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="1" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="14" type="line">
        <layer locked="1" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="171,171,171,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="246,246,246,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="15" type="line">
        <layer locked="1" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="171,171,171,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="1" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="246,246,246,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="16" type="line">
        <layer locked="0" pass="10" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="170,85,127,185" k="line_color"/>
          <prop v="dot" k="line_style"/>
          <prop v="2" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="17" type="line">
        <layer locked="0" pass="9" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="170,85,127,185" k="line_color"/>
          <prop v="dot" k="line_style"/>
          <prop v="2" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="18" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="192,223,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.86" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="19" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="1" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="150,150,150,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="2" type="line">
        <layer locked="0" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 10.65)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="249,178,156,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 8.25)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="20" type="line">
        <layer locked="0" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="167,168,170,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.1" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="21" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="1" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="167,168,170,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.1" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="22" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1500, 6.6)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="0.66;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="119,122,118,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1500, 6.6)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="23" type="line">
        <layer locked="0" pass="7" class="SimpleLine" enabled="1">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="24" type="line">
        <layer locked="0" pass="8" class="MarkerLine" enabled="1">
          <prop v="20" k="interval"/>
          <prop v="3x:0,0,0,0,0,0" k="interval_map_unit_scale"/>
          <prop v="MM" k="interval_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0" k="offset_along_line"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_along_line_map_unit_scale"/>
          <prop v="MM" k="offset_along_line_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="centralpoint" k="placement"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="rotate"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="@24@0" type="marker">
            <layer locked="0" pass="0" class="SvgMarker" enabled="1">
              <prop v="90" k="angle"/>
              <prop v="0,0,0,255" k="color"/>
              <prop v="0" k="fixedAspectRatio"/>
              <prop v="1" k="horizontal_anchor_point"/>
              <prop v="arrows/Arrow_06.svg" k="name"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="255,255,255,255" k="outline_color"/>
              <prop v="0" k="outline_width"/>
              <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="diameter" k="scale_method"/>
              <prop v="7.5" k="size"/>
              <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
              <prop v="MapUnit" k="size_unit"/>
              <prop v="1" k="vertical_anchor_point"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="25" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="1" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="167,168,170,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.1" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="3" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 10.65)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="5" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="249,178,156,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 8.25)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="4" type="line">
        <layer locked="0" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 10.65)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="252,214,164,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 8.25)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="5" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 10.65)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="4" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="252,214,164,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 8.25)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="6" type="line">
        <layer locked="0" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 6.6)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="247,250,190,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100,  5)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="7" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 6.6)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="3" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="247,250,190,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 5)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="8" type="line">
        <layer locked="0" pass="7" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 6.6)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="8" class="SimpleLine" enabled="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 5)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="9" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1000, 6.6)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" pass="2" class="SimpleLine" enabled="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 1100, 5)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{ffe47f43-26f4-40e4-a2e1-c6e9d6fcea76}">
      <rule scalemindenom="10000" filter=" &quot;highway&quot; IN ('motorway', 'trunk', 'primary')" key="{04490af1-75fe-48c0-9b2c-158512be2be6}" description="Motorway_Primary" scalemaxdenom="100000">
        <settings>
          <text-style fieldName="name" fontSizeUnit="MapUnit" textColor="68,68,68,255" fontCapitals="0" fontLetterSpacing="0.796875" fontFamily="Calibri" fontSize="11.5" previewBkgrdColor="#ffffff" multilineHeight="1" fontUnderline="0" fontWeight="50" textOpacity="1" useSubstitutions="0" fontItalic="1" isExpression="0" namedStyle="Italic" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" fontWordSpacing="0" blendMode="0">
            <text-buffer bufferColor="255,255,255,255" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="2.2" bufferDraw="1" bufferBlendMode="0" bufferOpacity="0.75" bufferSizeUnits="Point" bufferJoinStyle="128"/>
            <background shapeSVGFile="" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiX="0" shapeDraw="0" shapeOffsetX="0" shapeSizeUnit="MM" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeX="0" shapeOffsetUnit="MM" shapeType="0" shapeRotationType="0" shapeSizeType="0" shapeBorderWidth="0" shapeOffsetY="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0"/>
            <shadow shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOpacity="0.7" shadowScale="100" shadowOffsetGlobal="1" shadowUnder="0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" wrapChar="" useMaxLineLengthForAutoWrap="1" multilineAlign="0" rightDirectionSymbol=">" decimals="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" plussign="0"/>
          <placement fitInPolygonOnly="0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetType="0" maxCurvedCharAngleOut="-20" repeatDistance="0" repeatDistanceUnits="MM" xOffset="0" yOffset="0" maxCurvedCharAngleIn="20" centroidInside="0" placement="3" preserveRotation="1" rotationAngle="0" distMapUnitScale="3x:0,0,0,0,0,0" priority="4" placementFlags="9" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit"/>
          <rendering scaleMin="1" fontMinPixelSize="3" drawLabels="1" zIndex="0" maxNumLabels="2000" upsidedownLabels="0" obstacleFactor="1" labelPerPart="0" obstacle="1" mergeLines="1" obstacleType="0" minFeatureSize="3" limitNumLabels="0" scaleMax="50000" fontLimitPixelSize="0" displayAll="0" fontMaxPixelSize="10000" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="Size" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 333, 11.5)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
      <rule scalemindenom="5000" filter=" &quot;highway&quot; IN ('motorway', 'trunk', 'primary', 'Secondary')" key="{63365ada-cb73-4edf-a8eb-81176e50672c}" description="Secondary" scalemaxdenom="10000">
        <settings>
          <text-style fieldName="name" fontSizeUnit="MapUnit" textColor="68,68,68,255" fontCapitals="0" fontLetterSpacing="0.796875" fontFamily="Calibri" fontSize="11.5" previewBkgrdColor="#ffffff" multilineHeight="1" fontUnderline="0" fontWeight="50" textOpacity="1" useSubstitutions="0" fontItalic="1" isExpression="0" namedStyle="Italic" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" fontWordSpacing="0" blendMode="0">
            <text-buffer bufferColor="255,255,255,255" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="2.2" bufferDraw="1" bufferBlendMode="0" bufferOpacity="0.75" bufferSizeUnits="Point" bufferJoinStyle="128"/>
            <background shapeSVGFile="" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiX="0" shapeDraw="0" shapeOffsetX="0" shapeSizeUnit="MM" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeX="0" shapeOffsetUnit="MM" shapeType="0" shapeRotationType="0" shapeSizeType="0" shapeBorderWidth="0" shapeOffsetY="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0"/>
            <shadow shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOpacity="0.7" shadowScale="100" shadowOffsetGlobal="1" shadowUnder="0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" wrapChar="" useMaxLineLengthForAutoWrap="1" multilineAlign="0" rightDirectionSymbol=">" decimals="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" plussign="0"/>
          <placement fitInPolygonOnly="0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetType="0" maxCurvedCharAngleOut="-20" repeatDistance="0" repeatDistanceUnits="MM" xOffset="0" yOffset="0" maxCurvedCharAngleIn="20" centroidInside="0" placement="3" preserveRotation="1" rotationAngle="0" distMapUnitScale="3x:0,0,0,0,0,0" priority="4" placementFlags="9" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit"/>
          <rendering scaleMin="1" fontMinPixelSize="3" drawLabels="1" zIndex="0" maxNumLabels="2000" upsidedownLabels="0" obstacleFactor="1" labelPerPart="0" obstacle="1" mergeLines="1" obstacleType="0" minFeatureSize="3" limitNumLabels="0" scaleMax="50000" fontLimitPixelSize="0" displayAll="0" fontMaxPixelSize="10000" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="Size" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 333, 11.5)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
      <rule scalemindenom="1" filter="ELSE" key="{ef5114b4-61cc-4200-923d-9decd6ab13d9}" description="All" scalemaxdenom="5000">
        <settings>
          <text-style fieldName="name" fontSizeUnit="MapUnit" textColor="68,68,68,255" fontCapitals="0" fontLetterSpacing="0.796875" fontFamily="Calibri" fontSize="11.5" previewBkgrdColor="#ffffff" multilineHeight="1" fontUnderline="0" fontWeight="50" textOpacity="1" useSubstitutions="0" fontItalic="1" isExpression="0" namedStyle="Italic" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" fontWordSpacing="0" blendMode="0">
            <text-buffer bufferColor="255,255,255,255" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="2.2" bufferDraw="1" bufferBlendMode="0" bufferOpacity="0.75" bufferSizeUnits="Point" bufferJoinStyle="128"/>
            <background shapeSVGFile="" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiX="0" shapeDraw="0" shapeOffsetX="0" shapeSizeUnit="MM" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeX="0" shapeOffsetUnit="MM" shapeType="0" shapeRotationType="0" shapeSizeType="0" shapeBorderWidth="0" shapeOffsetY="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0"/>
            <shadow shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOpacity="0.7" shadowScale="100" shadowOffsetGlobal="1" shadowUnder="0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" wrapChar="" useMaxLineLengthForAutoWrap="1" multilineAlign="0" rightDirectionSymbol=">" decimals="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" plussign="0"/>
          <placement fitInPolygonOnly="0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetType="0" maxCurvedCharAngleOut="-20" repeatDistance="0" repeatDistanceUnits="MM" xOffset="0" yOffset="0" maxCurvedCharAngleIn="20" centroidInside="0" placement="3" preserveRotation="1" rotationAngle="0" distMapUnitScale="3x:0,0,0,0,0,0" priority="4" placementFlags="9" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit"/>
          <rendering scaleMin="1" fontMinPixelSize="3" drawLabels="1" zIndex="0" maxNumLabels="2000" upsidedownLabels="0" obstacleFactor="1" labelPerPart="0" obstacle="1" mergeLines="1" obstacleType="0" minFeatureSize="3" limitNumLabels="0" scaleMax="50000" fontLimitPixelSize="0" displayAll="0" fontMaxPixelSize="10000" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="Size" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 333, 11.5)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" scaleDependency="Area" rotationOffset="270" penWidth="0" diagramOrientation="Up" height="15" minScaleDenominator="0" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" barWidth="5" minimumSize="0" labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" width="15" scaleBasedVisibility="0" opacity="1" maxScaleDenominator="1e+08" backgroundAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,9.6,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" zIndex="0" obstacle="0" placement="2" linePlacementFlags="18" priority="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ways_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="osm_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="highway">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="z_order">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="attrs">
      <editWidget type="KeyValue">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="source">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="target">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="length_m">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="built_up">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="has_bridge">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="has_tunnel">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="has_parking">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="curve_index">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="terrain_index">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="park_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="startaltitude">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="endaltitude">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="percentslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="reversepercentslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="angleslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="reverseangleslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="totalascent">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="totaldescent">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" name="" index="0"/>
    <alias field="ways_id" name="" index="1"/>
    <alias field="osm_id" name="" index="2"/>
    <alias field="name" name="" index="3"/>
    <alias field="highway" name="" index="4"/>
    <alias field="z_order" name="" index="5"/>
    <alias field="attrs" name="" index="6"/>
    <alias field="source" name="" index="7"/>
    <alias field="target" name="" index="8"/>
    <alias field="length_m" name="" index="9"/>
    <alias field="built_up" name="" index="10"/>
    <alias field="has_bridge" name="" index="11"/>
    <alias field="has_tunnel" name="" index="12"/>
    <alias field="has_parking" name="" index="13"/>
    <alias field="curve_index" name="" index="14"/>
    <alias field="terrain_index" name="" index="15"/>
    <alias field="car_cost" name="" index="16"/>
    <alias field="car_reverse_cost" name="" index="17"/>
    <alias field="bus_cost" name="" index="18"/>
    <alias field="bus_reverse_cost" name="" index="19"/>
    <alias field="tram_cost" name="" index="20"/>
    <alias field="tram_reverse_cost" name="" index="21"/>
    <alias field="cycle_cost" name="" index="22"/>
    <alias field="cycle_reverse_cost" name="" index="23"/>
    <alias field="walk_cost" name="" index="24"/>
    <alias field="walk_reverse_cost" name="" index="25"/>
    <alias field="car_cost_time" name="" index="26"/>
    <alias field="car_reverse_cost_time" name="" index="27"/>
    <alias field="bus_cost_time" name="" index="28"/>
    <alias field="bus_reverse_cost_time" name="" index="29"/>
    <alias field="tram_cost_time" name="" index="30"/>
    <alias field="tram_reverse_cost_time" name="" index="31"/>
    <alias field="cycle_cost_time" name="" index="32"/>
    <alias field="cycle_reverse_cost_time" name="" index="33"/>
    <alias field="walk_cost_time" name="" index="34"/>
    <alias field="walk_reverse_cost_time" name="" index="35"/>
    <alias field="car_cost_met" name="" index="36"/>
    <alias field="car_reverse_cost_met" name="" index="37"/>
    <alias field="bus_cost_met" name="" index="38"/>
    <alias field="bus_reverse_cost_met" name="" index="39"/>
    <alias field="tram_cost_met" name="" index="40"/>
    <alias field="tram_reverse_cost_met" name="" index="41"/>
    <alias field="cycle_cost_met" name="" index="42"/>
    <alias field="cycle_reverse_cost_met" name="" index="43"/>
    <alias field="walk_cost_met" name="" index="44"/>
    <alias field="walk_reverse_cost_met" name="" index="45"/>
    <alias field="car_speed" name="" index="46"/>
    <alias field="bus_speed" name="" index="47"/>
    <alias field="tram_speed" name="" index="48"/>
    <alias field="cycle_speed" name="" index="49"/>
    <alias field="walk_speed" name="" index="50"/>
    <alias field="car_allow" name="" index="51"/>
    <alias field="bus_allow" name="" index="52"/>
    <alias field="cycle_allow" name="" index="53"/>
    <alias field="walk_allow" name="" index="54"/>
    <alias field="tram_allow" name="" index="55"/>
    <alias field="park_allow" name="" index="56"/>
    <alias field="car_oneway" name="" index="57"/>
    <alias field="bus_oneway" name="" index="58"/>
    <alias field="tram_oneway" name="" index="59"/>
    <alias field="cycle_oneway" name="" index="60"/>
    <alias field="walk_oneway" name="" index="61"/>
    <alias field="startaltitude" name="" index="62"/>
    <alias field="endaltitude" name="" index="63"/>
    <alias field="percentslope" name="" index="64"/>
    <alias field="reversepercentslope" name="" index="65"/>
    <alias field="angleslope" name="" index="66"/>
    <alias field="reverseangleslope" name="" index="67"/>
    <alias field="totalascent" name="" index="68"/>
    <alias field="totaldescent" name="" index="69"/>
    <alias field="train_cost" name="" index="70"/>
    <alias field="train_reverse_cost" name="" index="71"/>
    <alias field="train_cost_time" name="" index="72"/>
    <alias field="train_reverse_cost_time" name="" index="73"/>
    <alias field="train_cost_met" name="" index="74"/>
    <alias field="train_reverse_cost_met" name="" index="75"/>
    <alias field="train_allow" name="" index="76"/>
    <alias field="train_oneway" name="" index="77"/>
    <alias field="train_speed" name="" index="78"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="ways_id" expression="" applyOnUpdate="0"/>
    <default field="osm_id" expression="" applyOnUpdate="0"/>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="highway" expression="" applyOnUpdate="0"/>
    <default field="z_order" expression="" applyOnUpdate="0"/>
    <default field="attrs" expression="" applyOnUpdate="0"/>
    <default field="source" expression="" applyOnUpdate="0"/>
    <default field="target" expression="" applyOnUpdate="0"/>
    <default field="length_m" expression="" applyOnUpdate="0"/>
    <default field="built_up" expression="" applyOnUpdate="0"/>
    <default field="has_bridge" expression="" applyOnUpdate="0"/>
    <default field="has_tunnel" expression="" applyOnUpdate="0"/>
    <default field="has_parking" expression="" applyOnUpdate="0"/>
    <default field="curve_index" expression="" applyOnUpdate="0"/>
    <default field="terrain_index" expression="" applyOnUpdate="0"/>
    <default field="car_cost" expression="" applyOnUpdate="0"/>
    <default field="car_reverse_cost" expression="" applyOnUpdate="0"/>
    <default field="bus_cost" expression="" applyOnUpdate="0"/>
    <default field="bus_reverse_cost" expression="" applyOnUpdate="0"/>
    <default field="tram_cost" expression="" applyOnUpdate="0"/>
    <default field="tram_reverse_cost" expression="" applyOnUpdate="0"/>
    <default field="cycle_cost" expression="" applyOnUpdate="0"/>
    <default field="cycle_reverse_cost" expression="" applyOnUpdate="0"/>
    <default field="walk_cost" expression="" applyOnUpdate="0"/>
    <default field="walk_reverse_cost" expression="" applyOnUpdate="0"/>
    <default field="car_cost_time" expression="" applyOnUpdate="0"/>
    <default field="car_reverse_cost_time" expression="" applyOnUpdate="0"/>
    <default field="bus_cost_time" expression="" applyOnUpdate="0"/>
    <default field="bus_reverse_cost_time" expression="" applyOnUpdate="0"/>
    <default field="tram_cost_time" expression="" applyOnUpdate="0"/>
    <default field="tram_reverse_cost_time" expression="" applyOnUpdate="0"/>
    <default field="cycle_cost_time" expression="" applyOnUpdate="0"/>
    <default field="cycle_reverse_cost_time" expression="" applyOnUpdate="0"/>
    <default field="walk_cost_time" expression="" applyOnUpdate="0"/>
    <default field="walk_reverse_cost_time" expression="" applyOnUpdate="0"/>
    <default field="car_cost_met" expression="" applyOnUpdate="0"/>
    <default field="car_reverse_cost_met" expression="" applyOnUpdate="0"/>
    <default field="bus_cost_met" expression="" applyOnUpdate="0"/>
    <default field="bus_reverse_cost_met" expression="" applyOnUpdate="0"/>
    <default field="tram_cost_met" expression="" applyOnUpdate="0"/>
    <default field="tram_reverse_cost_met" expression="" applyOnUpdate="0"/>
    <default field="cycle_cost_met" expression="" applyOnUpdate="0"/>
    <default field="cycle_reverse_cost_met" expression="" applyOnUpdate="0"/>
    <default field="walk_cost_met" expression="" applyOnUpdate="0"/>
    <default field="walk_reverse_cost_met" expression="" applyOnUpdate="0"/>
    <default field="car_speed" expression="" applyOnUpdate="0"/>
    <default field="bus_speed" expression="" applyOnUpdate="0"/>
    <default field="tram_speed" expression="" applyOnUpdate="0"/>
    <default field="cycle_speed" expression="" applyOnUpdate="0"/>
    <default field="walk_speed" expression="" applyOnUpdate="0"/>
    <default field="car_allow" expression="" applyOnUpdate="0"/>
    <default field="bus_allow" expression="" applyOnUpdate="0"/>
    <default field="cycle_allow" expression="" applyOnUpdate="0"/>
    <default field="walk_allow" expression="" applyOnUpdate="0"/>
    <default field="tram_allow" expression="" applyOnUpdate="0"/>
    <default field="park_allow" expression="" applyOnUpdate="0"/>
    <default field="car_oneway" expression="" applyOnUpdate="0"/>
    <default field="bus_oneway" expression="" applyOnUpdate="0"/>
    <default field="tram_oneway" expression="" applyOnUpdate="0"/>
    <default field="cycle_oneway" expression="" applyOnUpdate="0"/>
    <default field="walk_oneway" expression="" applyOnUpdate="0"/>
    <default field="startaltitude" expression="" applyOnUpdate="0"/>
    <default field="endaltitude" expression="" applyOnUpdate="0"/>
    <default field="percentslope" expression="" applyOnUpdate="0"/>
    <default field="reversepercentslope" expression="" applyOnUpdate="0"/>
    <default field="angleslope" expression="" applyOnUpdate="0"/>
    <default field="reverseangleslope" expression="" applyOnUpdate="0"/>
    <default field="totalascent" expression="" applyOnUpdate="0"/>
    <default field="totaldescent" expression="" applyOnUpdate="0"/>
    <default field="train_cost" expression="" applyOnUpdate="0"/>
    <default field="train_reverse_cost" expression="" applyOnUpdate="0"/>
    <default field="train_cost_time" expression="" applyOnUpdate="0"/>
    <default field="train_reverse_cost_time" expression="" applyOnUpdate="0"/>
    <default field="train_cost_met" expression="" applyOnUpdate="0"/>
    <default field="train_reverse_cost_met" expression="" applyOnUpdate="0"/>
    <default field="train_allow" expression="" applyOnUpdate="0"/>
    <default field="train_oneway" expression="" applyOnUpdate="0"/>
    <default field="train_speed" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" constraints="3" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint field="ways_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="osm_id" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="name" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="highway" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="z_order" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="attrs" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="source" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="target" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="length_m" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="built_up" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="has_bridge" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="has_tunnel" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="has_parking" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="curve_index" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="terrain_index" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_reverse_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_reverse_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_reverse_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_reverse_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_reverse_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_reverse_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_reverse_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_reverse_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_reverse_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_reverse_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_reverse_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_reverse_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_reverse_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_reverse_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_reverse_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_speed" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_speed" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_speed" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_speed" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_speed" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_allow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_allow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_allow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_allow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_allow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="park_allow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="car_oneway" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="bus_oneway" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="tram_oneway" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cycle_oneway" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="walk_oneway" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="startaltitude" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="endaltitude" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="percentslope" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="reversepercentslope" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="angleslope" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="reverseangleslope" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="totalascent" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="totaldescent" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_reverse_cost" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_reverse_cost_time" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_reverse_cost_met" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_allow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_oneway" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="train_speed" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="ways_id" exp="" desc=""/>
    <constraint field="osm_id" exp="" desc=""/>
    <constraint field="name" exp="" desc=""/>
    <constraint field="highway" exp="" desc=""/>
    <constraint field="z_order" exp="" desc=""/>
    <constraint field="attrs" exp="" desc=""/>
    <constraint field="source" exp="" desc=""/>
    <constraint field="target" exp="" desc=""/>
    <constraint field="length_m" exp="" desc=""/>
    <constraint field="built_up" exp="" desc=""/>
    <constraint field="has_bridge" exp="" desc=""/>
    <constraint field="has_tunnel" exp="" desc=""/>
    <constraint field="has_parking" exp="" desc=""/>
    <constraint field="curve_index" exp="" desc=""/>
    <constraint field="terrain_index" exp="" desc=""/>
    <constraint field="car_cost" exp="" desc=""/>
    <constraint field="car_reverse_cost" exp="" desc=""/>
    <constraint field="bus_cost" exp="" desc=""/>
    <constraint field="bus_reverse_cost" exp="" desc=""/>
    <constraint field="tram_cost" exp="" desc=""/>
    <constraint field="tram_reverse_cost" exp="" desc=""/>
    <constraint field="cycle_cost" exp="" desc=""/>
    <constraint field="cycle_reverse_cost" exp="" desc=""/>
    <constraint field="walk_cost" exp="" desc=""/>
    <constraint field="walk_reverse_cost" exp="" desc=""/>
    <constraint field="car_cost_time" exp="" desc=""/>
    <constraint field="car_reverse_cost_time" exp="" desc=""/>
    <constraint field="bus_cost_time" exp="" desc=""/>
    <constraint field="bus_reverse_cost_time" exp="" desc=""/>
    <constraint field="tram_cost_time" exp="" desc=""/>
    <constraint field="tram_reverse_cost_time" exp="" desc=""/>
    <constraint field="cycle_cost_time" exp="" desc=""/>
    <constraint field="cycle_reverse_cost_time" exp="" desc=""/>
    <constraint field="walk_cost_time" exp="" desc=""/>
    <constraint field="walk_reverse_cost_time" exp="" desc=""/>
    <constraint field="car_cost_met" exp="" desc=""/>
    <constraint field="car_reverse_cost_met" exp="" desc=""/>
    <constraint field="bus_cost_met" exp="" desc=""/>
    <constraint field="bus_reverse_cost_met" exp="" desc=""/>
    <constraint field="tram_cost_met" exp="" desc=""/>
    <constraint field="tram_reverse_cost_met" exp="" desc=""/>
    <constraint field="cycle_cost_met" exp="" desc=""/>
    <constraint field="cycle_reverse_cost_met" exp="" desc=""/>
    <constraint field="walk_cost_met" exp="" desc=""/>
    <constraint field="walk_reverse_cost_met" exp="" desc=""/>
    <constraint field="car_speed" exp="" desc=""/>
    <constraint field="bus_speed" exp="" desc=""/>
    <constraint field="tram_speed" exp="" desc=""/>
    <constraint field="cycle_speed" exp="" desc=""/>
    <constraint field="walk_speed" exp="" desc=""/>
    <constraint field="car_allow" exp="" desc=""/>
    <constraint field="bus_allow" exp="" desc=""/>
    <constraint field="cycle_allow" exp="" desc=""/>
    <constraint field="walk_allow" exp="" desc=""/>
    <constraint field="tram_allow" exp="" desc=""/>
    <constraint field="park_allow" exp="" desc=""/>
    <constraint field="car_oneway" exp="" desc=""/>
    <constraint field="bus_oneway" exp="" desc=""/>
    <constraint field="tram_oneway" exp="" desc=""/>
    <constraint field="cycle_oneway" exp="" desc=""/>
    <constraint field="walk_oneway" exp="" desc=""/>
    <constraint field="startaltitude" exp="" desc=""/>
    <constraint field="endaltitude" exp="" desc=""/>
    <constraint field="percentslope" exp="" desc=""/>
    <constraint field="reversepercentslope" exp="" desc=""/>
    <constraint field="angleslope" exp="" desc=""/>
    <constraint field="reverseangleslope" exp="" desc=""/>
    <constraint field="totalascent" exp="" desc=""/>
    <constraint field="totaldescent" exp="" desc=""/>
    <constraint field="train_cost" exp="" desc=""/>
    <constraint field="train_reverse_cost" exp="" desc=""/>
    <constraint field="train_cost_time" exp="" desc=""/>
    <constraint field="train_reverse_cost_time" exp="" desc=""/>
    <constraint field="train_cost_met" exp="" desc=""/>
    <constraint field="train_reverse_cost_met" exp="" desc=""/>
    <constraint field="train_allow" exp="" desc=""/>
    <constraint field="train_oneway" exp="" desc=""/>
    <constraint field="train_speed" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" name="id" width="-1" type="field"/>
      <column hidden="0" name="osm_id" width="-1" type="field"/>
      <column hidden="0" name="name" width="-1" type="field"/>
      <column hidden="0" name="highway" width="-1" type="field"/>
      <column hidden="0" name="z_order" width="-1" type="field"/>
      <column hidden="0" name="attrs" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" name="ways_id" width="-1" type="field"/>
      <column hidden="0" name="source" width="-1" type="field"/>
      <column hidden="0" name="target" width="-1" type="field"/>
      <column hidden="0" name="length_m" width="-1" type="field"/>
      <column hidden="0" name="built_up" width="-1" type="field"/>
      <column hidden="0" name="has_bridge" width="-1" type="field"/>
      <column hidden="0" name="has_tunnel" width="-1" type="field"/>
      <column hidden="0" name="has_parking" width="-1" type="field"/>
      <column hidden="0" name="curve_index" width="-1" type="field"/>
      <column hidden="0" name="terrain_index" width="-1" type="field"/>
      <column hidden="0" name="car_cost" width="-1" type="field"/>
      <column hidden="0" name="car_reverse_cost" width="-1" type="field"/>
      <column hidden="0" name="bus_cost" width="-1" type="field"/>
      <column hidden="0" name="bus_reverse_cost" width="-1" type="field"/>
      <column hidden="0" name="tram_cost" width="-1" type="field"/>
      <column hidden="0" name="tram_reverse_cost" width="-1" type="field"/>
      <column hidden="0" name="cycle_cost" width="-1" type="field"/>
      <column hidden="0" name="cycle_reverse_cost" width="-1" type="field"/>
      <column hidden="0" name="walk_cost" width="-1" type="field"/>
      <column hidden="0" name="walk_reverse_cost" width="-1" type="field"/>
      <column hidden="0" name="car_cost_time" width="-1" type="field"/>
      <column hidden="0" name="car_reverse_cost_time" width="-1" type="field"/>
      <column hidden="0" name="bus_cost_time" width="-1" type="field"/>
      <column hidden="0" name="bus_reverse_cost_time" width="-1" type="field"/>
      <column hidden="0" name="tram_cost_time" width="-1" type="field"/>
      <column hidden="0" name="tram_reverse_cost_time" width="-1" type="field"/>
      <column hidden="0" name="cycle_cost_time" width="-1" type="field"/>
      <column hidden="0" name="cycle_reverse_cost_time" width="-1" type="field"/>
      <column hidden="0" name="walk_cost_time" width="-1" type="field"/>
      <column hidden="0" name="walk_reverse_cost_time" width="-1" type="field"/>
      <column hidden="0" name="car_cost_met" width="-1" type="field"/>
      <column hidden="0" name="car_reverse_cost_met" width="-1" type="field"/>
      <column hidden="0" name="bus_cost_met" width="-1" type="field"/>
      <column hidden="0" name="bus_reverse_cost_met" width="-1" type="field"/>
      <column hidden="0" name="tram_cost_met" width="-1" type="field"/>
      <column hidden="0" name="tram_reverse_cost_met" width="-1" type="field"/>
      <column hidden="0" name="cycle_cost_met" width="-1" type="field"/>
      <column hidden="0" name="cycle_reverse_cost_met" width="-1" type="field"/>
      <column hidden="0" name="walk_cost_met" width="-1" type="field"/>
      <column hidden="0" name="walk_reverse_cost_met" width="-1" type="field"/>
      <column hidden="0" name="car_speed" width="-1" type="field"/>
      <column hidden="0" name="bus_speed" width="-1" type="field"/>
      <column hidden="0" name="tram_speed" width="-1" type="field"/>
      <column hidden="0" name="cycle_speed" width="-1" type="field"/>
      <column hidden="0" name="walk_speed" width="-1" type="field"/>
      <column hidden="0" name="car_allow" width="-1" type="field"/>
      <column hidden="0" name="bus_allow" width="-1" type="field"/>
      <column hidden="0" name="cycle_allow" width="-1" type="field"/>
      <column hidden="0" name="walk_allow" width="-1" type="field"/>
      <column hidden="0" name="tram_allow" width="-1" type="field"/>
      <column hidden="0" name="park_allow" width="-1" type="field"/>
      <column hidden="0" name="car_oneway" width="-1" type="field"/>
      <column hidden="0" name="bus_oneway" width="-1" type="field"/>
      <column hidden="0" name="tram_oneway" width="-1" type="field"/>
      <column hidden="0" name="cycle_oneway" width="-1" type="field"/>
      <column hidden="0" name="walk_oneway" width="-1" type="field"/>
      <column hidden="0" name="startaltitude" width="-1" type="field"/>
      <column hidden="0" name="endaltitude" width="-1" type="field"/>
      <column hidden="0" name="percentslope" width="-1" type="field"/>
      <column hidden="0" name="reversepercentslope" width="-1" type="field"/>
      <column hidden="0" name="angleslope" width="-1" type="field"/>
      <column hidden="0" name="reverseangleslope" width="-1" type="field"/>
      <column hidden="0" name="totalascent" width="-1" type="field"/>
      <column hidden="0" name="totaldescent" width="-1" type="field"/>
      <column hidden="0" name="train_cost" width="-1" type="field"/>
      <column hidden="0" name="train_reverse_cost" width="-1" type="field"/>
      <column hidden="0" name="train_cost_time" width="-1" type="field"/>
      <column hidden="0" name="train_reverse_cost_time" width="-1" type="field"/>
      <column hidden="0" name="train_cost_met" width="-1" type="field"/>
      <column hidden="0" name="train_reverse_cost_met" width="-1" type="field"/>
      <column hidden="0" name="train_allow" width="-1" type="field"/>
      <column hidden="0" name="train_oneway" width="-1" type="field"/>
      <column hidden="0" name="train_speed" width="-1" type="field"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">C:/PROGRA~1/QGIS3~1.4/bin</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>C:/PROGRA~1/QGIS3~1.4/bin</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="angleslope"/>
    <field editable="1" name="attrs"/>
    <field editable="1" name="built_up"/>
    <field editable="1" name="bus_allow"/>
    <field editable="1" name="bus_cost"/>
    <field editable="1" name="bus_cost_met"/>
    <field editable="1" name="bus_cost_time"/>
    <field editable="1" name="bus_oneway"/>
    <field editable="1" name="bus_reverse_cost"/>
    <field editable="1" name="bus_reverse_cost_met"/>
    <field editable="1" name="bus_reverse_cost_time"/>
    <field editable="1" name="bus_speed"/>
    <field editable="1" name="car_allow"/>
    <field editable="1" name="car_cost"/>
    <field editable="1" name="car_cost_met"/>
    <field editable="1" name="car_cost_time"/>
    <field editable="1" name="car_oneway"/>
    <field editable="1" name="car_reverse_cost"/>
    <field editable="1" name="car_reverse_cost_met"/>
    <field editable="1" name="car_reverse_cost_time"/>
    <field editable="1" name="car_speed"/>
    <field editable="1" name="curve_index"/>
    <field editable="1" name="cycle_allow"/>
    <field editable="1" name="cycle_cost"/>
    <field editable="1" name="cycle_cost_met"/>
    <field editable="1" name="cycle_cost_time"/>
    <field editable="1" name="cycle_oneway"/>
    <field editable="1" name="cycle_reverse_cost"/>
    <field editable="1" name="cycle_reverse_cost_met"/>
    <field editable="1" name="cycle_reverse_cost_time"/>
    <field editable="1" name="cycle_speed"/>
    <field editable="1" name="endaltitude"/>
    <field editable="1" name="has_bridge"/>
    <field editable="1" name="has_parking"/>
    <field editable="1" name="has_tunnel"/>
    <field editable="1" name="highway"/>
    <field editable="1" name="id"/>
    <field editable="1" name="length_m"/>
    <field editable="1" name="name"/>
    <field editable="1" name="osm_id"/>
    <field editable="1" name="park_allow"/>
    <field editable="1" name="percentslope"/>
    <field editable="1" name="reverseangleslope"/>
    <field editable="1" name="reversepercentslope"/>
    <field editable="1" name="source"/>
    <field editable="1" name="startaltitude"/>
    <field editable="1" name="target"/>
    <field editable="1" name="terrain_index"/>
    <field editable="1" name="totalascent"/>
    <field editable="1" name="totaldescent"/>
    <field editable="1" name="train_allow"/>
    <field editable="1" name="train_cost"/>
    <field editable="1" name="train_cost_met"/>
    <field editable="1" name="train_cost_time"/>
    <field editable="1" name="train_oneway"/>
    <field editable="1" name="train_reverse_cost"/>
    <field editable="1" name="train_reverse_cost_met"/>
    <field editable="1" name="train_reverse_cost_time"/>
    <field editable="1" name="train_speed"/>
    <field editable="1" name="tram_allow"/>
    <field editable="1" name="tram_cost"/>
    <field editable="1" name="tram_cost_met"/>
    <field editable="1" name="tram_cost_time"/>
    <field editable="1" name="tram_oneway"/>
    <field editable="1" name="tram_reverse_cost"/>
    <field editable="1" name="tram_reverse_cost_met"/>
    <field editable="1" name="tram_reverse_cost_time"/>
    <field editable="1" name="tram_speed"/>
    <field editable="1" name="walk_allow"/>
    <field editable="1" name="walk_cost"/>
    <field editable="1" name="walk_cost_met"/>
    <field editable="1" name="walk_cost_time"/>
    <field editable="1" name="walk_oneway"/>
    <field editable="1" name="walk_reverse_cost"/>
    <field editable="1" name="walk_reverse_cost_met"/>
    <field editable="1" name="walk_reverse_cost_time"/>
    <field editable="1" name="walk_speed"/>
    <field editable="1" name="ways_id"/>
    <field editable="1" name="z_order"/>
  </editable>
  <labelOnTop>
    <field name="angleslope" labelOnTop="0"/>
    <field name="attrs" labelOnTop="0"/>
    <field name="built_up" labelOnTop="0"/>
    <field name="bus_allow" labelOnTop="0"/>
    <field name="bus_cost" labelOnTop="0"/>
    <field name="bus_cost_met" labelOnTop="0"/>
    <field name="bus_cost_time" labelOnTop="0"/>
    <field name="bus_oneway" labelOnTop="0"/>
    <field name="bus_reverse_cost" labelOnTop="0"/>
    <field name="bus_reverse_cost_met" labelOnTop="0"/>
    <field name="bus_reverse_cost_time" labelOnTop="0"/>
    <field name="bus_speed" labelOnTop="0"/>
    <field name="car_allow" labelOnTop="0"/>
    <field name="car_cost" labelOnTop="0"/>
    <field name="car_cost_met" labelOnTop="0"/>
    <field name="car_cost_time" labelOnTop="0"/>
    <field name="car_oneway" labelOnTop="0"/>
    <field name="car_reverse_cost" labelOnTop="0"/>
    <field name="car_reverse_cost_met" labelOnTop="0"/>
    <field name="car_reverse_cost_time" labelOnTop="0"/>
    <field name="car_speed" labelOnTop="0"/>
    <field name="curve_index" labelOnTop="0"/>
    <field name="cycle_allow" labelOnTop="0"/>
    <field name="cycle_cost" labelOnTop="0"/>
    <field name="cycle_cost_met" labelOnTop="0"/>
    <field name="cycle_cost_time" labelOnTop="0"/>
    <field name="cycle_oneway" labelOnTop="0"/>
    <field name="cycle_reverse_cost" labelOnTop="0"/>
    <field name="cycle_reverse_cost_met" labelOnTop="0"/>
    <field name="cycle_reverse_cost_time" labelOnTop="0"/>
    <field name="cycle_speed" labelOnTop="0"/>
    <field name="endaltitude" labelOnTop="0"/>
    <field name="has_bridge" labelOnTop="0"/>
    <field name="has_parking" labelOnTop="0"/>
    <field name="has_tunnel" labelOnTop="0"/>
    <field name="highway" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="length_m" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="osm_id" labelOnTop="0"/>
    <field name="park_allow" labelOnTop="0"/>
    <field name="percentslope" labelOnTop="0"/>
    <field name="reverseangleslope" labelOnTop="0"/>
    <field name="reversepercentslope" labelOnTop="0"/>
    <field name="source" labelOnTop="0"/>
    <field name="startaltitude" labelOnTop="0"/>
    <field name="target" labelOnTop="0"/>
    <field name="terrain_index" labelOnTop="0"/>
    <field name="totalascent" labelOnTop="0"/>
    <field name="totaldescent" labelOnTop="0"/>
    <field name="train_allow" labelOnTop="0"/>
    <field name="train_cost" labelOnTop="0"/>
    <field name="train_cost_met" labelOnTop="0"/>
    <field name="train_cost_time" labelOnTop="0"/>
    <field name="train_oneway" labelOnTop="0"/>
    <field name="train_reverse_cost" labelOnTop="0"/>
    <field name="train_reverse_cost_met" labelOnTop="0"/>
    <field name="train_reverse_cost_time" labelOnTop="0"/>
    <field name="train_speed" labelOnTop="0"/>
    <field name="tram_allow" labelOnTop="0"/>
    <field name="tram_cost" labelOnTop="0"/>
    <field name="tram_cost_met" labelOnTop="0"/>
    <field name="tram_cost_time" labelOnTop="0"/>
    <field name="tram_oneway" labelOnTop="0"/>
    <field name="tram_reverse_cost" labelOnTop="0"/>
    <field name="tram_reverse_cost_met" labelOnTop="0"/>
    <field name="tram_reverse_cost_time" labelOnTop="0"/>
    <field name="tram_speed" labelOnTop="0"/>
    <field name="walk_allow" labelOnTop="0"/>
    <field name="walk_cost" labelOnTop="0"/>
    <field name="walk_cost_met" labelOnTop="0"/>
    <field name="walk_cost_time" labelOnTop="0"/>
    <field name="walk_oneway" labelOnTop="0"/>
    <field name="walk_reverse_cost" labelOnTop="0"/>
    <field name="walk_reverse_cost_met" labelOnTop="0"/>
    <field name="walk_reverse_cost_time" labelOnTop="0"/>
    <field name="walk_speed" labelOnTop="0"/>
    <field name="ways_id" labelOnTop="0"/>
    <field name="z_order" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
