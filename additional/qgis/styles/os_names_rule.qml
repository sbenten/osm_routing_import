<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.3-Madeira" maxScale="-4.65661e-10" simplifyDrawingHints="0" labelsEnabled="1" readOnly="0" minScale="1e+08" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="0" type="singleSymbol" forceraster="0">
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="marker">
        <layer locked="0" pass="0" class="SimpleMarker" enabled="1">
          <prop v="0" k="angle"/>
          <prop v="164,186,36,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="no" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
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
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{2d6e387c-f1e5-4126-af64-daeccb8e00c9}">
      <rule scalemindenom="30000" filter=" &quot;sub_type&quot; IN ('City', 'Town')" key="{36ee7861-a245-4d15-9696-6cfaa8b1a13b}" description="City_Town" scalemaxdenom="1000000">
        <settings>
          <text-style fieldName="name" fontSizeUnit="MapUnit" textColor="0,0,0,255" fontCapitals="0" fontLetterSpacing="0" fontFamily="Calibri" fontSize="200" previewBkgrdColor="#ffffff" multilineHeight="1" fontUnderline="0" fontWeight="50" textOpacity="1" useSubstitutions="0" fontItalic="0" isExpression="0" namedStyle="Regular" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" fontWordSpacing="0" blendMode="0">
            <text-buffer bufferColor="255,255,255,255" bufferNoFill="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferDraw="1" bufferBlendMode="0" bufferOpacity="1" bufferSizeUnits="MM" bufferJoinStyle="128"/>
            <background shapeSVGFile="" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiX="0" shapeDraw="0" shapeOffsetX="0" shapeSizeUnit="MM" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeX="0" shapeOffsetUnit="MM" shapeType="0" shapeRotationType="0" shapeSizeType="0" shapeBorderWidth="0" shapeOffsetY="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0"/>
            <shadow shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOpacity="0.7" shadowScale="100" shadowOffsetGlobal="1" shadowUnder="0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" wrapChar="" useMaxLineLengthForAutoWrap="1" multilineAlign="3" rightDirectionSymbol=">" decimals="3" reverseDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" plussign="0"/>
          <placement fitInPolygonOnly="0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetType="0" maxCurvedCharAngleOut="-25" repeatDistance="0" repeatDistanceUnits="MM" xOffset="0" yOffset="0" maxCurvedCharAngleIn="25" centroidInside="0" placement="0" preserveRotation="1" rotationAngle="0" distMapUnitScale="3x:0,0,0,0,0,0" priority="5" placementFlags="10" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MM"/>
          <rendering scaleMin="30000" fontMinPixelSize="3" drawLabels="1" zIndex="0" maxNumLabels="2000" upsidedownLabels="0" obstacleFactor="1" labelPerPart="0" obstacle="0" mergeLines="0" obstacleType="0" minFeatureSize="0" limitNumLabels="0" scaleMax="1000000" fontLimitPixelSize="0" displayAll="1" fontMaxPixelSize="10000" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="Size" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 500, 200)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
      <rule scalemindenom="1" filter=" &quot;sub_type&quot; IS NOT NULL" key="{f398cf5b-0ffc-4894-82ba-5df0ae216732}" description="Everything" scalemaxdenom="30000">
        <settings>
          <text-style fieldName="name" fontSizeUnit="MapUnit" textColor="0,0,0,255" fontCapitals="0" fontLetterSpacing="0" fontFamily="Calibri" fontSize="28" previewBkgrdColor="#ffffff" multilineHeight="1" fontUnderline="0" fontWeight="50" textOpacity="1" useSubstitutions="0" fontItalic="0" isExpression="0" namedStyle="Regular" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" fontWordSpacing="0" blendMode="0">
            <text-buffer bufferColor="255,255,255,255" bufferNoFill="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferDraw="1" bufferBlendMode="0" bufferOpacity="1" bufferSizeUnits="MM" bufferJoinStyle="128"/>
            <background shapeSVGFile="" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiX="0" shapeDraw="0" shapeOffsetX="0" shapeSizeUnit="MM" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeX="0" shapeOffsetUnit="MM" shapeType="0" shapeRotationType="0" shapeSizeType="0" shapeBorderWidth="0" shapeOffsetY="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0"/>
            <shadow shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOpacity="0.7" shadowScale="100" shadowOffsetGlobal="1" shadowUnder="0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" wrapChar="" useMaxLineLengthForAutoWrap="1" multilineAlign="3" rightDirectionSymbol=">" decimals="3" reverseDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" plussign="0"/>
          <placement fitInPolygonOnly="0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetType="0" maxCurvedCharAngleOut="-25" repeatDistance="0" repeatDistanceUnits="MM" xOffset="0" yOffset="0" maxCurvedCharAngleIn="25" centroidInside="0" placement="0" preserveRotation="1" rotationAngle="0" distMapUnitScale="3x:0,0,0,0,0,0" priority="5" placementFlags="10" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MM"/>
          <rendering scaleMin="30000" fontMinPixelSize="3" drawLabels="1" zIndex="0" maxNumLabels="2000" upsidedownLabels="0" obstacleFactor="1" labelPerPart="0" obstacle="0" mergeLines="0" obstacleType="0" minFeatureSize="0" limitNumLabels="0" scaleMax="1000000" fontLimitPixelSize="0" displayAll="1" fontMaxPixelSize="10000" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="Size" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 250, 28)" type="QString"/>
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
    <property value="name" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" scaleDependency="Area" rotationOffset="270" penWidth="0" diagramOrientation="Up" height="15" minScaleDenominator="-4.65661e-10" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" barWidth="5" minimumSize="0" labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" width="15" scaleBasedVisibility="0" opacity="1" maxScaleDenominator="1e+08" backgroundAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,9.6,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" zIndex="0" obstacle="0" placement="0" linePlacementFlags="18" priority="0">
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
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sub_type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="outcode">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" name="" index="0"/>
    <alias field="name" name="" index="1"/>
    <alias field="type" name="" index="2"/>
    <alias field="sub_type" name="" index="3"/>
    <alias field="x" name="" index="4"/>
    <alias field="y" name="" index="5"/>
    <alias field="outcode" name="" index="6"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="type" expression="" applyOnUpdate="0"/>
    <default field="sub_type" expression="" applyOnUpdate="0"/>
    <default field="x" expression="" applyOnUpdate="0"/>
    <default field="y" expression="" applyOnUpdate="0"/>
    <default field="outcode" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" constraints="3" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint field="name" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="sub_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="x" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="y" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="outcode" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="name" exp="" desc=""/>
    <constraint field="type" exp="" desc=""/>
    <constraint field="sub_type" exp="" desc=""/>
    <constraint field="x" exp="" desc=""/>
    <constraint field="y" exp="" desc=""/>
    <constraint field="outcode" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" name="id" width="-1" type="field"/>
      <column hidden="0" name="name" width="-1" type="field"/>
      <column hidden="0" name="type" width="-1" type="field"/>
      <column hidden="0" name="sub_type" width="-1" type="field"/>
      <column hidden="0" name="x" width="-1" type="field"/>
      <column hidden="0" name="y" width="-1" type="field"/>
      <column hidden="0" name="outcode" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
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
from PyQt4.QtGui import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="id"/>
    <field editable="1" name="name"/>
    <field editable="1" name="outcode"/>
    <field editable="1" name="sub_type"/>
    <field editable="1" name="type"/>
    <field editable="1" name="x"/>
    <field editable="1" name="y"/>
  </editable>
  <labelOnTop>
    <field name="id" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="outcode" labelOnTop="0"/>
    <field name="sub_type" labelOnTop="0"/>
    <field name="type" labelOnTop="0"/>
    <field name="x" labelOnTop="0"/>
    <field name="y" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
